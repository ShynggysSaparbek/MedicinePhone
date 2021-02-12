//
//  LocationConfigurator.swift
//  MedicineProjectV2
//
//  Created by Saparbek . on 2/12/21.
//  Copyright © 2021 w2. All rights reserved.
//

import Foundation
protocol LocationConfiguratorProtocol{
    func configure(with viewController: LocationViewController)
}
class LocationConfigurator: LocationConfiguratorProtocol{
    init(){
        
    }
    
    func configure(with viewController: LocationViewController){
        let presenter = LocationPresenter(view: viewController)
        let interactor = LocationInteractor(presenter: presenter)
        let router = LocationRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
