//
//  GenderManager.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/16/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
import CoreData
protocol GenderServiceProtocol {
    func get() -> GenderStructure?
    func set(structure: GenderStructure)
    func delete()
    
    func isRegistred() -> Bool
    func verification(structure: GenderStructure) -> Bool
    
}
class GenderService: GenderServiceProtocol{
    
    
    func create(structure: GenderStructure, completion: (NSManagedObjectContext, Gender)->()){
        StoredVariableManager.create(type: Gender.self, structure: structure)
    }
    
    func get() -> GenderStructure? {
        guard isRegistred() else { return nil }
        
        let structure = GenderStructure()
        return StoredVariableManager.get(type: Gender.self, structure: structure)
    }
    
    func delete(){
        guard isRegistred() else { return }
        
        StoredVariableManager.delete(type: Gender.self)
    }
    
    func set(structure: GenderStructure){
        guard verification(structure: structure) else { return }
        
        StoredVariableManager.set(type: Gender.self, structure: structure)
    }
    func isRegistred() -> Bool{
        return StoredVariableManager.isRegistred(type: Gender.self)
    }
    
    func verification(structure: GenderStructure) -> Bool {
        return true
    }
}


