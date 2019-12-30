//
//  PhoneInteractor.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/19/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
protocol PhoneInteractorProtocol {
    func setPhone(with number: String)
    func getPhoneNumber()->String?
}
class PhoneInteractor: PhoneInteractorProtocol {
    weak var presenter: PhonePresenterProtocol!
    var service: PhoneServiceProtocol = PhoneService()
    
    required init(presenter: PhonePresenterProtocol) {
        self.presenter = presenter
    }
    
    func setPhone(with number: String) {
        let phone = PhoneStructure(number: number)
        service.set(structure: phone)
    }
    
    func getPhoneNumber()->String?{
        let phone = service.get()
        return phone?.number
    }
}
