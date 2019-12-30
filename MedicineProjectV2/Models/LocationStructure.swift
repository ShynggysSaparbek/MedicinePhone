//
//  LocationStructure.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/17/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
import CoreData


struct LocationStructure: Named{
    var name: String?
    var longitude: Double
    var latitude: Double
    init() {
        name = nil
        longitude = 0
        latitude = 0
    }
    
    init(name: String, longitude: Double, latitude: Double){
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
    }
    func setValues<T: NSManagedObject>(of object: T){
        
        guard let location = object as? Location else { return }
        
        location.setValue(name, forKey: "name")
        location.setValue(longitude, forKey: "longitude")
        location.setValue(latitude, forKey: "latitude")
    }
    mutating func getValues<T: NSManagedObject>(from object: T){
        
        guard let location = object as? Location else { return }
        
        self.name = location.name
        self.longitude = location.longitude
        self.latitude = location.latitude
    }
}
