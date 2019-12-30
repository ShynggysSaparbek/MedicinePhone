//
//  QuestionnaireInteractor.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
protocol QuestionnaireInteractorProtocol {
    func getAllLocations()->[LocationStructure]?
    
    func isAnswearInVariantList(answear: String)->Bool
    func fillQuestion(with answear: String)
    func getCoeficient()->Double
    
    func moveToNextQuestion()
    func moveToPreviousQuestion()
    
    func isLastQuestion()->Bool
    func getQuestion()->QuestionStructure
    
    func getQuestionIndex()->Int
    func questionnaireLength() -> Int
}

class QuestionnaireInteractor: QuestionnaireInteractorProtocol {
    weak var presenter: QuestionnairePresenterProtocol!
    var locationService: LocationsServiceProtocol = LocationsService()
    var questionnaireService: QuestionnaireServiceProtocol!
    
    required init(presenter: QuestionnairePresenterProtocol) {
        self.presenter = presenter
        self.questionnaireService = QuestionnaireService()
    }
    
    func getAllLocations() -> [LocationStructure]? {
        return locationService.getAll()
    }
    
    
    //MARK: Functions to answearing the question
    func isAnswearInVariantList(answear: String)->Bool{
        return questionnaireService.isAnswearInVariantList(answear: answear)
    }
    func fillQuestion(with answear: String) {
        questionnaireService.fillQuestion(with: answear)
    }
    
    
    // MARK: Functions to browse through questionnaire
    func getQuestion()->QuestionStructure{
        return questionnaireService.currentQuestion
    }
    func moveToNextQuestion() {
        guard !questionnaireService.isCurrentALastQuestion() else { return }
        questionnaireService.nextQestion()
    }
    func moveToPreviousQuestion() {
        guard !questionnaireService.isCurrentAFirstQuestion() else { return }
        questionnaireService.previousQuestion()
    }
    func isLastQuestion() -> Bool {
    return questionnaireService.isCurrentALastQuestion()
}
    func isFirstQuestion() -> Bool {
        return questionnaireService.isCurrentAFirstQuestion()
    }
    
    // MARK: Functions to set up proggress bar
    func getQuestionIndex() -> Int {
        return questionnaireService.getQuestionIndex()
    }
    func questionnaireLength() -> Int {
        return questionnaireService.questionnaireLength()
    }
    
    //MARK: Functions to prepare response
    func getCoeficient() -> Double {
        do {
            let coeficient = try questionnaireService.getCoeficient()
            return coeficient
        }catch{
            print("At least one of the questions is not filled with answear")
        }
        return 0
    }
}
