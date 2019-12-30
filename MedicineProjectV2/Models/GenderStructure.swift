//
//  GenderStructure.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/17/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
import CoreData
struct GenderStructure: Setable {
    var status: String?
    
    func setValues<T: NSManagedObject>(of object: T){
        guard let gender = object as? Gender else {
            print("Given object is not Gender type")
            print("\(object)")
            return
        }
        
        gender.setValue(status, forKey: "status")
    }
    mutating func getValues<T: NSManagedObject>(from object: T){
        guard let gender = object as? Gender else { return }
        self.status = gender.status
    }
}
