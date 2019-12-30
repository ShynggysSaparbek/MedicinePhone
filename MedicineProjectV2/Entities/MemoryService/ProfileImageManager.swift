//
//  imageManager.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/16/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
import CoreData

class ProfileImageManager: StoredVariable {
    
    static func create(structure: ProfileImageStructure, completion: (NSManagedObjectContext, ProfileImage)->()){
        StoredVariableManager.create(type: ProfileImage.self, structure: structure)
    }
    
    static func get() -> ProfileImageStructure? {
        guard isRegistred() else { return nil }
        
        let structure = ProfileImageStructure()
        return StoredVariableManager.get(type: ProfileImage.self, structure: structure)
    }
    
    static func delete(){
        guard isRegistred() else { return }
        
        StoredVariableManager.delete(type: ProfileImage.self)
    }
    
    static func set(structure: ProfileImageStructure){
        guard verification(structure: structure) else { return }
        
        StoredVariableManager.set(type: ProfileImage.self, structure: structure)
    }
    static func isRegistred() -> Bool{
        return StoredVariableManager.isRegistred(type: ProfileImage.self)
    }
    
    static func verification(structure: ProfileImageStructure) -> Bool {
        return true
    }
}
