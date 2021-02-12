//
//  QuestionnaireViewController.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
class QuestionnaireViewController: UIViewController {
    var presenter: QuestionnairePresenterProtocol!
    var configurator: QuestionnaireConfiguratorProtocol = QuestionnaireConfigurator()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionsView: OptionsView!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var proggressView: UIProgressView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configurator.configure(with: self)
        presenter.configureView()
        
    }
    @IBAction func returnButtonPressed(_ sender: UIButton) {
        presenter.returnToMain()
    }
    
    func configureOptionButtonsBehaviour(){
        
        let optionButtons = optionsView.getOptionButtons()
        for button in optionButtons{
            button.addTarget(self, action: #selector(editButtonPressed(_:)), for: .touchDown)
        }
    }
    
    @objc func editButtonPressed(_ sender: UIButton){
        guard let answear = sender.titleLabel?.text else { return }
        presenter.answear(answear: answear)
    }
}
