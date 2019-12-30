//
//  LocationViewController.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
protocol LocationsInteractorProtocol {
    func getLocation(by name: String)->LocationStructure?
    func getAllLocations()->[LocationStructure]?
    func deleteLocation(by name: String)
    func countLocations()->Int
    func addLocation(location: LocationStructure)
}
class LocationsInteractor: LocationsInteractorProtocol {
    weak var presenter: LocationsPresenterProtocol!
    var service: LocationsServiceProtocol = LocationsService()
    
    required init(presenter: LocationsPresenterProtocol) {
        self.presenter = presenter
    }
    
    func addLocation(location: LocationStructure){
        service.add(structure: location)
    }
    func getLocation(by name: String) -> LocationStructure? {
        return service.get(by: name)
    }
    
    func getAllLocations() -> [LocationStructure]? {
        return service.getAll()
    }
    
    func deleteLocation(by name: String) {
        return service.delete(by: name)
    }
    
    func countLocations()->Int{
        return service.count()
    }
}
