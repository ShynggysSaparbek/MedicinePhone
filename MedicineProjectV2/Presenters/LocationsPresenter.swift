//
//  LocationPresenter.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
protocol LocationsPresenterProtocol: class {
    var router: LocationRouterProtocol! { get set }
    var interactor: LocationsInteractorProtocol! {get set}
    
    func configureView()
    func settingDidFinished()
    
    func getLocation(by name: String)->LocationStructure?
    func getAllLocations()->[LocationStructure]?
    func deleteLocation(by name: String)
    func addLocation(location: LocationStructure)
    func countLocations()->Int
    func addLocation(name: String, latitude: Double, longitude: Double)
    
    
}
class LocationsPresenter: LocationsPresenterProtocol{
    
    
    weak var view: LocationsViewController!
    var router: LocationRouterProtocol!
    var interactor: LocationsInteractorProtocol!
    
    var location: [LocationStructure]!
    init(view: LocationsViewController) {
        self.view = view
    }
    
    func configureView() {
        location = getAllLocations()
    }
    func addLocation(location: LocationStructure){
        interactor.addLocation(location: location)
        
    }
    
    func addLocation(name: String, latitude: Double, longitude: Double){
        let location = LocationStructure(name: name,
                                         longitude: longitude,
                                         latitude: latitude)
        addLocation(location: location)
    }
    
    func settingDidFinished() {
        router.moveToQuestionnaire()
    }
    func moveToPhoneRegistration(){
        router.moveToPhoneRegistartion()
    }
    func getLocation(by name: String) -> LocationStructure? {
        return interactor.getLocation(by: name)
    }
    
    func getAllLocations() -> [LocationStructure]? {
        return interactor.getAllLocations()
    }
    
    func deleteLocation(by name: String) {
        return interactor.deleteLocation(by: name)
    }
    
    func countLocations() -> Int {
        return interactor.countLocations()
    }
}
