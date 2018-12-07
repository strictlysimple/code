//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Sound.playGameSound()
        displayQuestion()
    }
    
    // MARK: - Helpers
    func displayQuestion() {
        let question = QuizManager.provideRandomQuestion()
        questionField.text = question.question
        firstButton.setTitle(question.options[0], for: .normal)
        secondButton.setTitle(question.options[1], for: .normal)
        thirdButton.setTitle(question.options[2], for: .normal)
        fourthButton.setTitle(question.options[3], for: .normal)
        playAgainButton.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer uttons
        firstButton.isHidden = true
        secondButton.isHidden = true
        thirdButton.isHidden = true
        fourthButton.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(QuizManager.correctQuestions) out of \(QuizManager.questionsPerRound) correct!"
    }
    
    func nextRound() {
        if QuizManager.questionsAsked == QuizManager.questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    // MARK: - Actions
    @IBAction func checkAnswer(_ sender: UIButton) {
        QuizManager.questionsAsked += 1
        if sender.tag == QuizManager.provideCorrectAnswer() {
            QuizManager.correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        loadNextRound(delay: 2)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        // Show the answer buttons
        firstButton.isHidden = false
        secondButton.isHidden = false
        thirdButton.isHidden = false
        fourthButton.isHidden = false
        
        QuizManager.questionsAsked = 0
        QuizManager.correctQuestions = 0
        nextRound()
    }
}
