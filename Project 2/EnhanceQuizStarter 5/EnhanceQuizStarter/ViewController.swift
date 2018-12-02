//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion = 0
    let QuizQuestions = Questions()
    var gameSound: SystemSoundID = 0
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGameStartSound()
        playGameStartSound()
        displayQuestion()
    }
    
    // MARK: - Helpers
    
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: QuizQuestions.list.count)
        let questionDictionary = QuizQuestions.list[indexOfSelectedQuestion]
        questionField.text = questionDictionary.question
        firstButton.setTitle(questionDictionary.optionA, for: UIControl.State.normal)
        secondButton.setTitle(questionDictionary.optionB, for: UIControl.State.normal)
        thirdButton.setTitle(questionDictionary.optionC, for: UIControl.State.normal)
        fourthButton.setTitle(questionDictionary.optionD, for: UIControl.State.normal)
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
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
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
        // Increment the questions asked counter
        
        questionsAsked += 1
        let selectedQuestionDict = QuizQuestions.list[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.corrAnswer
        if sender.tag == correctAnswer {
            correctQuestions += 1
            questionField.text = "Correct!"
        }else {
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
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

}


