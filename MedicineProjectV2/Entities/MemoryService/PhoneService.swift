//
//  PhoneManager.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/16/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
import CoreData
protocol PhoneServiceProtocol {
    
    func get() -> PhoneStructure?
    func set(structure: PhoneStructure)
    func delete()
    
    func isRegistred() -> Bool
    func verification(structure: PhoneStructure) -> Bool
}

class PhoneService: PhoneServiceProtocol{
    
    func create(structure: PhoneStructure, completion: (NSManagedObjectContext, Phone)->()){
        StoredVariableManager.create(type: Phone.self, structure: structure)
    }
    
    func get() -> PhoneStructure? {
        guard isRegistred() else { return nil}
        let structure = PhoneStructure()
        return StoredVariableManager.get(type: Phone.self, structure: structure)
    }
    
    func delete(){
        guard isRegistred() else { return }
        StoredVariableManager.delete(type: Phone.self)
    }
    
    func set(structure: PhoneStructure){
        //guard verification(structure: structure) else { return }
        
        StoredVariableManager.set(type: Phone.self, structure: structure)
    }
    func isRegistred() -> Bool{
        return StoredVariableManager.isRegistred(type: Phone.self)
    }
    
    func verification(structure: PhoneStructure) -> Bool {
        return true
    }
}

