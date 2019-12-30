//
//  LocationConfiguration.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
protocol LocationsConfiguratorProtocol {
    func configure(with viewController: LocationsViewController)
}
class LocationsConfigurator: LocationsConfiguratorProtocol {
    init(){
        
    }
    func configure(with viewController: LocationsViewController){
        let presenter = LocationsPresenter(view: viewController)
        let interactor = LocationsInteractor(presenter: presenter)
        let router = LocationsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
