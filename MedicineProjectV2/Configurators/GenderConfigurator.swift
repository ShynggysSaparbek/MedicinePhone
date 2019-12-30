//
//  GenderConfiguration.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
protocol GenderConfiguratorProtocol {
    func configure(with viewController: GenderViewController)
}
class GenderConfigurator: GenderConfiguratorProtocol {
    init(){
        
    }
    func configure(with viewController: GenderViewController){
        let presenter = GenderPresenter(view: viewController)
        let interactor = GenderInteractor(presenter: presenter)
        let router = GenderRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
