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
    var genderService: GenderService!
    
    required init(viewController: PhoneViewController) {
        self.viewController = viewController
        genderService = GenderService()
    }
    
    func closeCurrentViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func registrationDidFinished() {
        if genderService.isRegistred() {
            viewController.performSegue(withIdentifier: "home", sender: nil)
        }else {
            viewController.performSegue(withIdentifier: "setGender", sender: nil)
        }
    }
}
