//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
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
        let buttonTitle: String = sender.currentTitle!
        let submittedAnswer: String = buttonTitle.lowercased()
        
        if quizBrain.checkAnswer(submittedAnswer) {
            updateUI()
            animateUIButton(buttonPressed: buttonTitle, color: answerRightColor)
        } else {
            animateUIButton(buttonPressed: buttonTitle, color: answerWrongColor)
        }
        
    }
    
    // update UI
    func updateUI() {
        if quizBrain.getCurrentQuestionNumber() == 0 {
            progressBar.progress = 1/Float(quizBrain.getTotalQuestionNumber())
        } else {
            progressBar.progress += 1/Float(quizBrain.getTotalQuestionNumber())
        }
        
        questionLabel.text = quizBrain.getQuizText()
    }
    
    // trigger button animation
    func animateUIButton(buttonPressed: String, color: UIColor) {
        if (buttonPressed == "True") {
            buttonAnimation(selectedButton: self.trueButton, color: color)
        } else {
            buttonAnimation(selectedButton: self.falseButton, color: color)
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

