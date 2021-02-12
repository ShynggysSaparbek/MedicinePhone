//
//  LocationRouter.swift
//  MedicineProjectV2
//
//  Created by Saparbek . on 2/12/21.
//  Copyright © 2021 w2. All rights reserved.
//

import Foundation
protocol LocationRouterProtocol{
    var viewController: LocationViewController! {get set}
    
    func returnToLocations()
}
class LocationRouter: LocationRouterProtocol{
    var viewController: LocationViewController!
    
    required init(viewController: LocationViewController) {
        self.viewController = viewController
    }
    
    func returnToLocations(){
        viewController.dismiss(animated: true, completion: nil)
    }
}
