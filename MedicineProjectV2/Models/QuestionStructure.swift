//
//  QuestionStructure.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/21/19.
//  Copyright © 2019 w2. All rights reserved.
//

import Foundation
struct QuestionStructure{
    var title: String
    var description: [String: String] = [:]
    var options: [String: Double]
    var answear: String?
    
    init(title: String, description: [String: String], options: [String: Double]){
        self.title = title
        self.options = options
        self.description = description
    }
    init(title: String, options: [String: Double]){
        self.title = title
        self.options = options
    }
}
