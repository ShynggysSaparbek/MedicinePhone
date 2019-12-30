//
//  StoredVariableManager.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/16/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
import CoreData

protocol Setable{
    func setValues<T: NSManagedObject>(of object: T)
    mutating func getValues<T: NSManagedObject>(from object: T)
}
protocol StoredVariable{
    associatedtype SaveableEntity
    associatedtype EntityStructure
    
    static func get()->EntityStructure?
    static func set(structure: EntityStructure)
    static func delete()
    
    static func create(structure: EntityStructure, completion: (NSManagedObjectContext, SaveableEntity)->())
}
class StoredVariableManager{
    
    static func get<T: NSManagedObject, Structure: Setable>(type: T.Type, structure: Structure) -> Structure? {
        var structure = structure
        
        MemoryManager.fetch(T.self) { (context, result) in
            for object in result {
                structure.getValues(from: object)
                return
            }
        }
        return structure
    }
    
    static func set<T: NSManagedObject>(type: T.Type, structure: Setable){
        delete(type: T.self)
        
        //guard verification(name: name, latitude: latitude, longitude: longitude) else { return }
        create(type: T.self, structure: structure)
    }
    
    static func delete<T: NSManagedObject>(type: T.Type){
        MemoryManager.fetch(type.self) { (context, result) in
            for object in result {
                context.delete(object)
            }
        }
    }
    static func create<T: NSManagedObject>(type: T.Type, structure: Setable){
        MemoryManager.create(type: T.self) { (object) in
            structure.setValues(of: object)
        }
    }
    
    static func isRegistred<T: NSManagedObject>(type: T.Type) -> Bool{
        var isRegistred = false
        MemoryManager.fetch(T.self) { (context, result) in
            if result.count == 1 {
                isRegistred = true
            }else{
                isRegistred = false
            }
        }
        return isRegistred
    }
}
