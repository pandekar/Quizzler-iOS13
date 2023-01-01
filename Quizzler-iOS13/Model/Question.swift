//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Pande Adhistanaya on 23/12/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let questionText: String
    let answerOpts: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.questionText = q
        self.answerOpts = a
        self.correctAnswer = correctAnswer
    }
}
