//
//  GenderViewController.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
protocol GenderViewProtocol{
    
}
class GenderViewController: UIViewController {
    
    var presenter: GenderPresenterProtocol!
    var configurator: GenderConfiguratorProtocol = GenderConfigurator()
    
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.configureView()
        
    }
    @IBAction func maleButtonPressed(_ sender: UIButton) {
        presenter.setGender(with: "male")
        guard presenter.getGenderStatus() == "male" else {
            return
        }
        presenter.registrationDidFinished()
    }
    
    @IBAction func femaleButtonPressed(_ sender: UIButton) {
        presenter.setGender(with: "female")
        guard presenter.getGenderStatus() == "female" else {
            return
        }
        presenter.registrationDidFinished()
    }
}
