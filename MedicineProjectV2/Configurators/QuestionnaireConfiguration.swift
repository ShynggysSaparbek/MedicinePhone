//
//  QuestionnaireConfiguration.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
protocol QuestionnaireConfiguratorProtocol {
    func configure(with viewController: QuestionnaireViewController)
}
class QuestionnaireConfigurator: QuestionnaireConfiguratorProtocol {
    init(){
        
    }
    func configure(with viewController: QuestionnaireViewController){
        let presenter = QuestionnairePresenter(view: viewController)
        let interactor = QuestionnaireInteractor(presenter: presenter)
        let router = QuestionnaireRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
    }
}
