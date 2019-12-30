//
//  GenderRouter.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
protocol GenderRouterProtocol {
    var viewController: GenderViewController! {get set}
    func closeCurrentViewController()
    func registrationDidFinished()
}
class GenderRouter: GenderRouterProtocol {
    weak var viewController: GenderViewController!
    
    required init(viewController: GenderViewController) {
        self.viewController = viewController
    }
    
    func closeCurrentViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func registrationDidFinished() {
        viewController.performSegue(withIdentifier: "home", sender: nil)
    }
}
