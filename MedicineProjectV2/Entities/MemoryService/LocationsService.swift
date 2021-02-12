//
//  LocationManager.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/17/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
import CoreData
protocol LocationsServiceProtocol {
    func get(by name: String) -> LocationStructure?
    func getAll()->[LocationStructure]
    
    func add(structure: LocationStructure)
    
    func delete(by name: String)
    func deleteAll()
    
    func create(structure: LocationStructure, completion: (NSManagedObjectContext, Location)->())
    
    func verification(structure: LocationStructure) -> Bool
    func count()->Int
}
final class LocationsService: LocationsServiceProtocol{
    
    func get(by name: String) -> LocationStructure? {
        let location: LocationStructure = LocationStructure()
        
        return StoredArrayManager.get(by: name, structure: location, type: Location.self)
    }
    func getAll()->[LocationStructure]{
        let location: LocationStructure = LocationStructure()
        return StoredArrayManager.getAll(type: Location.self, structure: location)
    }
    
    func add(structure: LocationStructure){
        guard verification(structure: structure) else { return }
        StoredArrayManager.add(type: Location.self, structure: structure)
    }
    
    
    func delete(by name: String){
        let location: LocationStructure = LocationStructure()
        StoredArrayManager.delete(by: name, using: location, type: Location.self)
    }
    func deleteAll(){
        StoredArrayManager.deleteAll(type: Location.self)
    }
    
    func create(structure: LocationStructure, completion: (NSManagedObjectContext, Location)->()){
        StoredArrayManager.create(type: Location.self, structure: structure)
    }
    
   
    func verification(structure: LocationStructure) -> Bool{
        return true
    }
    
    func count()->Int{
        return StoredArrayManager.count(type: Location.self)
    }
}
