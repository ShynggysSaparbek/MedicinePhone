//
//  PhoneRegistartionViewController.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/19/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
protocol PhoneViewProtocol: class {
}
class PhoneViewController: UIViewController, PhoneViewProtocol {
    var presenter: PhonePresenterProtocol!
    var configurator: PhoneConfiguratorProtocol = PhoneConfigurator()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.configureView()
        
    }
    @IBAction func savePhoneNumberButton(_ sender: UIButton) {
        guard let number = textField.text else { return }
        presenter.setPhone(with: number)
        
        presenter.registrationDidFinished()
    }
}
