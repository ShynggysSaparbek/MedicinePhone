//
//  PhoneRegistrationConfigurator.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/19/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation

protocol PhoneConfiguratorProtocol {
    func configure(with viewController: PhoneViewController)
}

class PhoneConfigurator: PhoneConfiguratorProtocol{
    
    init(){
        
    }
    func configure(with viewController: PhoneViewController){
        let presenter = PhonePresenter(view: viewController)
        let interactor = PhoneInteractor(presenter: presenter)
        let router = PhoneRouter(viewController: viewController)
            
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
