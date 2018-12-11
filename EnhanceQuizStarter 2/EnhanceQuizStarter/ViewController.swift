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
    
    var  question : Question = Question(question: "", options: [], correctAnswer: 0);
    
    // MARK: - Helpers
    func displayQuestion() {
        question = self.quizManager.provideRandomQuestion()
        questionField.text = question.question
        firstButton.setTitle(question.options[0], for: .normal)
        secondButton.setTitle(question.options[1], for: .normal)
        thirdButton.setTitle(question.options[2], for: .normal)
        fourthButton.setTitle(question.options[3], for: .normal)
        playAgainButton.isHidden = true
        acceptsClick=true;
    }
    
    func setButtonviz(viz: Bool)
    {
        firstButton.isHidden = viz
        secondButton.isHidden = viz
        thirdButton.isHidden = viz
        fourthButton.isHidden = viz
    }
    
    func displayScore() {
        // Hide the answer uttons
        setButtonviz(viz: true);
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(quizManager.correctQuestions) out of \(quizManager.questionsPerRound) correct!"
    }
    
    var quizManager : QuizManager = QuizManager();
    
    func nextRound() {
        if self.quizManager.questionsAsked == self.quizManager.questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    func loadNextQuestion(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    var acceptsClick:Bool = false;
    
    // MARK: - Actions
    @IBAction func checkAnswer(_ sender: UIButton) {
        
        if(!acceptsClick){
            return;
        }
        
        acceptsClick=false;
        self.quizManager.questionsAsked += 1
        if sender.tag == question.correctAnswer {
            self.quizManager.correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        loadNextQuestion(delay: 1);
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        // Show the answer buttons
        setButtonviz(viz: false);
        
        fourthButton.isHidden = false
        
        self.quizManager = QuizManager();
        
        nextRound()
    }
    
}
