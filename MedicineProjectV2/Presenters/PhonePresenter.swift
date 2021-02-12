//
//  PhoneRegistrationPresenter.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/19/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
protocol PhonePresenterProtocol: class{
    var router: PhoneRouterProtocol! { get set }
    var interactor: PhoneInteractorProtocol! {get set}
    
    func configureView()
    func registrationDidFinished()
    func setPhone(with number: String)
    func getPhoneNumber()->String?
}
class PhonePresenter: PhonePresenterProtocol {
    
    weak var view: PhoneViewProtocol!
    var interactor: PhoneInteractorProtocol!
    var router: PhoneRouterProtocol!
    
    required init(view: PhoneViewProtocol) {
        self.view = view
    }
    
    func configureView(){
        if(interactor.isPhoneNumberRegistred()){
            router.registrationDidFinished()
        }
    }
    func setPhone(with number: String) {
        interactor.setPhone(with: number)
    }
    func getPhoneNumber()->String?{
        return interactor.getPhoneNumber()
    }
    
    func registrationDidFinished(){
        router.registrationDidFinished()
    }
}
