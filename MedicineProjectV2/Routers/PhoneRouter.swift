//
//  PhoneRegistrationRouter.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/19/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
protocol PhoneRouterProtocol{
    var viewController: PhoneViewController! {get set}
    func closeCurrentViewController()
    func registrationDidFinished()
}
class PhoneRouter: PhoneRouterProtocol {
    weak var viewController: PhoneViewController!
    
    required init(viewController: PhoneViewController) {
        self.viewController = viewController
    }
    
    func closeCurrentViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func registrationDidFinished() {
        viewController.performSegue(withIdentifier: "setGender", sender: nil)
    }
}
