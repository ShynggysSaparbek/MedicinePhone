//
//  StoredArrayManager.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/16/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
import CoreData

protocol Named: Setable{
    var name: String? { get set }
}

protocol StoredArray {
    associatedtype SaveableEntity
    associatedtype EntityStructure
    
    
    static func get(by name: String)->EntityStructure?
    static func getAll()->[EntityStructure]
    
    static func add(structure: EntityStructure)
    
    static func delete(by name: String)
    static func deleteAll()
    
    static func create(structure: EntityStructure, completion: (NSManagedObjectContext, SaveableEntity)->())
    static func verification(structure: EntityStructure)->Bool
}

final class StoredArrayManager {
    
    static func get<T: NSManagedObject, Structure: Named>(by name: String, structure: Structure, type: T.Type) -> Structure? {
        var structure = structure
        MemoryManager.fetch(T.self) { (context, result) in
            for object in result {
                structure.getValues(from: object)
                if structure.name == name{
                    return
                }
            }
        }
        guard let _ = structure.name else { return nil }
        return structure
    }
    
    static func getAll<T: NSManagedObject, Structure: Named>(type: T.Type, structure: Structure)->[Structure]{
        var structures: [Structure] = []
        var structure = structure
        MemoryManager.fetch(T.self) { (context, result) in
            for object in result{
                structure.getValues(from: object)
                structures.append(structure)
            }
        }
        return structures
    }
    
    static func deleteAll<T: NSManagedObject>(type: T.Type){
        MemoryManager.fetch(T.self) { (context, result) in
            for object in result {
                context.delete(object)
            }
        }
    }
    
    static func delete<T: NSManagedObject>(by name: String, using structure: Named, type: T.Type){
        var structure = structure
        MemoryManager.fetch(T.self) { (context, result) in
            for object in result {
                structure.getValues(from: object)
                if structure.name == name{
                    context.delete(object)
                }
            }
        }
    }
    
    
    static func add<T: NSManagedObject>(type: T.Type, structure: Named){
        create(type: T.self, structure: structure)
    }
    
    static func create<T: NSManagedObject>(type: T.Type, structure: Named){
        MemoryManager.create(type: T.self) { (object) in
            structure.setValues(of: object)
        }
    }

    static func count<T: NSManagedObject>(type: T.Type)->Int{
        var sum = 0
        MemoryManager.fetch(T.self) { (context, result) in
            sum = result.count
        }
        return sum
    }
}

