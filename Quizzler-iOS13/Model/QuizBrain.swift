//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Pande Adhistanaya on 25/12/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    // question data
    let quiz: [Question] = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    // question number
    var questionNumber: Int = 0
    
    // quiz score
    var questionScore: Int = 0
    
    // get total question number
    func getTotalQuestionNumber() -> Int {
        return quiz.count
    }
    
    // get quiz score
    func getScoreText() -> String {
        return "Score: \(questionScore)"
    }
    
    // get bar progress
    func getBarProgress() -> Float {
        return 1/Float(self.getTotalQuestionNumber())
    }
    
    // get current question number
    func getCurrentQuestionNumber() -> Int {
        return questionNumber
    }
    
    // get quiz text
    func getQuizText() -> String {
        return quiz[self.questionNumber].questionText
    }
    
    // get quiz answer option 1
    func getQuizAnswerFirst() -> String {
        return quiz[self.questionNumber].answerOpts[0]
    }
    
    // get quiz answer option 2
    func getQuizAnswerSecond() -> String {
        return quiz[self.questionNumber].answerOpts[1]
    }
    
    // get quiz answer option 3
    func getQuizAnswerThird() -> String {
        return quiz[self.questionNumber].answerOpts[2]
    }
    
    // check answer
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let userAnswer: String = userAnswer
        
        if(userAnswer == quiz[questionNumber].correctAnswer) && (questionNumber < quiz.count - 1) {
            self.questionNumber += 1
            self.questionScore += 1
            return true
        } else if(userAnswer == quiz[questionNumber].correctAnswer) && (questionNumber == quiz.count - 1) {
            self.questionNumber = 0
            self.questionScore = 0
            return true
        } else {
            return false
        }
    }
}
