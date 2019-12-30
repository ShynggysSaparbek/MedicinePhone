//
//  GenderInteractor.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
protocol GenderInteractorProtocol {
    func setStatus(with status: String)
    func getStatus()->String?
}
class GenderInteractor: GenderInteractorProtocol {
    weak var presenter: GenderPresenterProtocol!
    var service: GenderServiceProtocol = GenderService()
    
    init(presenter: GenderPresenterProtocol){
        self.presenter = presenter
    }
    
    func setStatus(with status: String) {
        let gender = GenderStructure(status: status)
        service.set(structure: gender)
    }
    
    func getStatus() -> String? {
        let gender = service.get()
        return gender?.status
    }
    
}
