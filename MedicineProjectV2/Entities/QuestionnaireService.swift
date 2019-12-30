//
//  QuestionnaireService.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/21/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
protocol QuestionnaireServiceProtocol{
    var currentQuestion: QuestionStructure! {get set}
    func fillQuestion(with answer: String)
    func isAnswearInVariantList(answear: String)->Bool
    
    func nextQestion()
    func previousQuestion()
    
    func isCurrentALastQuestion()->Bool
    func isCurrentAFirstQuestion()->Bool
    func getQuestionIndex()->Int
    func questionnaireLength()-> Int
    
    func getCoeficient()throws -> Double
    
}

class QuestionnaireService: QuestionnaireServiceProtocol {
    
    var currentQuestion: QuestionStructure!
    var currentIndex: Int!
    var questions: [QuestionStructure] = []
    
    init(){
        setQuestions()
        guard questions.count != 0 else { return }
        currentIndex = 0
        currentQuestion = questions[currentIndex]
    }
    
    //Mark: Functions to answear the question
    func isAnswearInVariantList(answear: String)->Bool{
        for variant in currentQuestion.options {
            if variant.key == answear {
                return true
            }
        }
        return false
    }
    func fillQuestion(with answear: String) {
        currentQuestion.answear = answear
    }
    
    //Mark: Functions to browse through questionnaire
    func nextQestion() {
        currentIndex += 1
        currentQuestion = questions[currentIndex]
    }
    func previousQuestion() {
        currentIndex -= 1
        currentQuestion = questions[currentIndex]
    }
    
    //Mark: Functions to set up progress bar
    func isCurrentALastQuestion()->Bool {
        return currentIndex == questions.count - 1
    }
    func isCurrentAFirstQuestion()->Bool {
        return currentIndex == 0
    }
    func getQuestionIndex() -> Int {
        return currentIndex
    }
    func questionnaireLength()-> Int{
        return questions.count
    }
    
    //Mark: Functions to calculate coeficient
    func getCoeficient()throws -> Double {
        var sum: Double = 0
        for question in questions{
            guard let answear = question.answear else { return -1}
            guard let value = question.options[answear] else { return -1 }
            sum += value
        }
        return sum
    }
    
    
    private func setQuestions(){
        questions.append(QuestionStructure(title: "Кому вызываем?",
                                           options: ["Родственнику / себе": 0.1, " Третьему лицу ": 0.2]))
        questions.append(QuestionStructure(title: "Возраст пациента",
                                           options: ["0-1": 0.1, "2-14": 0.2, "15-39": 0.3, "40-69": 0.4, "70+": 0.5, "Не знаю":0.5]))
        questions.append(QuestionStructure(title: "Сознание человека",
                                           options: ["Чистое": 0.1, "Неясное": 0.2, "Без Сознания": 0.3, "Не знаю" : 0.4]))
        questions.append(QuestionStructure(title: "Дыхание человека",
                                           options: ["Чистое": 0.1, "Одышка": 0.2, "Задыхается": 0.3, "Не знаю": 0.4]))
        questions.append(QuestionStructure(title: "Способность ходить",
                                           options: ["Обычное": 0.1, "С поддержкой": 0.2, "Без Сознания": 0.3, "Не знаю": 0.4]))
        questions.append(QuestionStructure(title: "Дыхание человека",
                                           options: ["Чистое": 0.1, "Одышка": 0.2, "Задыхается": 0.3, "Не знаю": 0.4]))
        questions.append(QuestionStructure(title: "Посинения",
                                           options: ["Есть": 0.1, "Нет": 0.2]))
        questions.append(QuestionStructure(title: "Потеет",
                                           options: ["Да": 0.1, "Нет": 0.2, "Не знаю": 0.3]))
        
    }
}
