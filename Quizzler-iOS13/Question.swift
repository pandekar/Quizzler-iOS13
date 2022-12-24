//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Pande Adhistanaya on 23/12/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: Bool
    
    init(q: String, a: Bool) {
        self.text = q
        self.answer = a
    }
}
