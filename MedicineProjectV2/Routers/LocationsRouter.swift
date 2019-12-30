//
//  LocationRouter.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
protocol LocationRouterProtocol: class {
    var viewController: LocationsViewController! {get set}
    func closeCurrentViewController()
    func moveToQuestionnaire()
    func moveToPhoneRegistartion()
}
class LocationsRouter: LocationRouterProtocol{
    weak var viewController: LocationsViewController!
    
    required init(viewController: LocationsViewController) {
        self.viewController = viewController
    }
    
    func closeCurrentViewController(){
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func moveToQuestionnaire(){
        viewController.performSegue(withIdentifier: "showQuestionnaire", sender: nil)
    }
    
    func moveToPhoneRegistartion(){
        viewController.performSegue(withIdentifier: "changePhone", sender: nil)
    }
}
