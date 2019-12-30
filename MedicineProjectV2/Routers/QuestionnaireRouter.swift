//
//  QuestionnaireRouter.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
protocol QuestionnaireRouterProtocol: class {
    var viewController: QuestionnaireViewController! {get set}
    func moveToMain()
}
class QuestionnaireRouter: QuestionnaireRouterProtocol{
    weak var viewController: QuestionnaireViewController!
    
    required init(viewController: QuestionnaireViewController) {
        self.viewController = viewController
    }
    
    func closeCurrentViewController(){
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func moveToMain() {
        viewController.performSegue(withIdentifier: "home", sender: nil)
    }
}
