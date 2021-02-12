//
//  LocationInteractor.swift
//  MedicineProjectV2
//
//  Created by Saparbek . on 2/12/21.
//  Copyright © 2021 w2. All rights reserved.
//

import UIKit
protocol LocationInteractorProtocol: class {
    
}
class LocationInteractor: LocationInteractorProtocol{
    var presenter: LocationPresenterProtocol!
    required init(presenter: LocationPresenterProtocol) {
        self.presenter = presenter
    }

}
