//
//  QuestionnairePresenter.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
protocol QuestionnairePresenterProtocol: class {
    var router: QuestionnaireRouterProtocol! { get set }
    var interactor: QuestionnaireInteractorProtocol! {get set}
    
    func configureView()
    
    func moveToNextQuestion()
    func moveToPreviousQuestion()
    func returnToMain()
    func answear(answear: String)
    
}
class QuestionnairePresenter: QuestionnairePresenterProtocol {
    weak var viewController: QuestionnaireViewController!
    var router: QuestionnaireRouterProtocol!
    var interactor: QuestionnaireInteractorProtocol!

    
    required init(view: QuestionnaireViewController){
        self.viewController = view
    }
    
    // MARK: Configuring views
    func configureView() {
        let question = interactor.getQuestion()
        viewController.questionLabel.text = question.title
        
        changeProgressView()
        changeOptionsView(with: question)
        viewController.configureOptionButtonsBehaviour()
    }
    
    // Configuring ProggressView
    private func changeProgressView(){
        let progress = Float( interactor.getQuestionIndex())  / Float(interactor.questionnaireLength())
        viewController.proggressView.progress = progress
    }
    
    // Configuring OptionView
    private func changeOptionsView(with question: QuestionStructure){
        viewController.optionsView.changeOptionView(with: question.options)
    }
    
    
    //MARK: Routing from one question to another
    //Routing to next question
    func moveToNextQuestion(){
        interactor.moveToNextQuestion()
        configureView()
    }
    
    //Routing to previous question
    func moveToPreviousQuestion() {
        interactor.moveToPreviousQuestion()
        configureView()
    }
    
    //Routing to main
    func returnToMain(){
        router.moveToMain()
    }
    
    
    //MARK: Saving and sending answear
    //Saving an answear for current question
    func answear(answear: String) {
        guard interactor.isAnswearInVariantList(answear: answear) else { return }
        interactor.fillQuestion(with: answear)
        
        if interactor.isLastQuestion(){
            print("We made a call")
            call()
        }else{
            moveToNextQuestion()
            print("Answeared with answear \(answear)")
        }
    }
    
    //Sending answears to fullfilled questionnaire
    func call(){
        viewController.questionLabel.text = "Вызов направлен"
        viewController.proggressView.progress = 1
        viewController.optionsView.removeOptionButtons()
        viewController.returnButton.setTitle("Отмена", for: .normal)
    }
}
