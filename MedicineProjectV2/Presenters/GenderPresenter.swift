//
//  GenderPresenter.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
protocol GenderPresenterProtocol: class {
    var router: GenderRouterProtocol! { get set }
    var interactor: GenderInteractorProtocol! {get set}
    
    func configureView()
    func setGender(with status: String)
    func getGenderStatus()->String?
    func registrationDidFinished()
    
}
class GenderPresenter: GenderPresenterProtocol {
    weak var view: GenderViewController!
    var router: GenderRouterProtocol!
    var interactor: GenderInteractorProtocol!
    
    required init(view: GenderViewController){
        self.view = view
    }
    func setGender(with status: String) {
        interactor.setStatus(with: status)
    }
    
    func getGenderStatus()->String? {
        return interactor.getStatus()
    }
    
    func registrationDidFinished() {
        router.registrationDidFinished()
    }
    
    func configureView() {
        print("")
    }
}
