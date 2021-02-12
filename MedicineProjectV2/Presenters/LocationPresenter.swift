//
//  LocationPresenter.swift
//  MedicineProjectV2
//
//  Created by Saparbek . on 2/12/21.
//  Copyright © 2021 w2. All rights reserved.
//

import UIKit
protocol LocationPresenterProtocol: class {
    var router: LocationRouterProtocol! { get set }
    var interactor: LocationInteractorProtocol! {get set}
    
    func configureView()
    func returnToLocations()
}
class LocationPresenter: LocationPresenterProtocol{
    weak var view: LocationViewController!
    var router: LocationRouterProtocol!
    var interactor: LocationInteractorProtocol!
    
    required init(view: LocationViewController){
        self.view = view
    }
    func configureView(){
        
    }
    
    func returnToLocations() {
        router.returnToLocations()
    }
    
}
