//
//  PhoneStructure.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/17/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
import CoreData

struct PhoneStructure: Setable{
    
    var number: String?
    
    func setValues<T: NSManagedObject>(of object: T){
        guard let phone = object as? Phone else { return }
        phone.setValue(number, forKey: "number")
    }
    mutating func getValues<T: NSManagedObject>(from object: T){
        guard let phone = object as? Phone else { return }
        self.number = phone.number
    }
}
