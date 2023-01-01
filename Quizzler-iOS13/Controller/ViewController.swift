//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var buttonFirstAnswer: UIButton!
    @IBOutlet weak var buttonSecondAnswer: UIButton!
    @IBOutlet weak var buttonThirdAnswer: UIButton!
    
    var quizBrain: QuizBrain = QuizBrain()
    let answerRightColor: UIColor = UIColor.green
    let answerWrongColor: UIColor = UIColor.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    //answer button pressed
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let submittedAnswer: String = sender.currentTitle!
        let isAnswerRight: Bool = quizBrain.checkAnswer(submittedAnswer)
        let buttonPressed: Int = sender.tag

        if isAnswerRight  {
            updateUI()
            animateUIButton(buttonPressed, answerRightColor)
        } else {
            animateUIButton(buttonPressed, answerWrongColor)
        }
        
    }
    
    // update UI
    func updateUI() {
        if quizBrain.getCurrentQuestionNumber() == 0 {
            progressBar.progress = quizBrain.getBarProgress()
        } else {
            progressBar.progress += quizBrain.getBarProgress()
        }
        
        questionLabel.text = quizBrain.getQuizText()
        buttonFirstAnswer.tag = 0
        buttonSecondAnswer.tag = 1
        buttonThirdAnswer.tag = 2
        buttonFirstAnswer.setTitle(quizBrain.getQuizAnswerFirst(), for: .normal)
        buttonSecondAnswer.setTitle(quizBrain.getQuizAnswerSecond(), for: .normal)
        buttonThirdAnswer.setTitle(quizBrain.getQuizAnswerThird(), for: .normal)
        scoreLabel.text = quizBrain.getScoreText ()
    }
    
    // trigger button animation
    func animateUIButton(_ buttonPressedTag: Int, _ color: UIColor) {
        switch buttonPressedTag {
        case 0:
            buttonAnimation(selectedButton: self.buttonFirstAnswer, color: color)
        case 1:
            buttonAnimation(selectedButton: self.buttonSecondAnswer, color: color)
        default:
            buttonAnimation(selectedButton: self.buttonThirdAnswer, color: color)
        }
    }
    
    // UIButton Animation
    func buttonAnimation(selectedButton: UIButton, color: UIColor) {
        UIView.animate(withDuration: 0.2) {
            selectedButton.backgroundColor = color
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.2) {
                selectedButton.backgroundColor = nil
            }
        }
    }
}

