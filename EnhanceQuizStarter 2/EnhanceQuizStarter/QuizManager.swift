//
//  Questions.swift
//  EnhanceQuizStarter
//
//  Created by Bojan Mitreski on 12/1/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import GameKit

class QuizManager{
     var questionArray = [
        Question(question: "This was the only US President to serve more than two consecutive terms.", options: ["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson"], correctAnswer: 2),
        Question(question: "Which of the following countries has the most residents?", options: ["Nigeria", "Russia", "Iran", "Vietnam"], correctAnswer: 1),
        Question(question: "In what year was the United Nations founded?", options: ["1918", "1919", "1945", "1954"], correctAnswer: 3),
        Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", options: ["Paris", "Washington D.C.", "New York City", "Boston"], correctAnswer: 3),
        Question(question: "Which nation produces the most oil?", options: ["Iran", "Iraq", "Brazil", "Canada"], correctAnswer: 4),
        Question(question: "Which country has most recently won consecutive World Cups in Soccer?", options: ["Italy", "Brazil", "Argentina", "Spain"], correctAnswer: 2),
        Question(question: "Which of the following rivers is longest?", options: ["Yangtze", "Mississippi","Congo", "Mekong"], correctAnswer: 2),
        Question(question: "Which city is the oldest?", options: ["Mexico City", "Cape Town", "San Juan", "Sydney"], correctAnswer: 1)
    ]

    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion = 0
    
    func provideRandomQuestion() -> Question {

        return  questionArray.remove(
            at: GKRandomSource.sharedRandom().nextInt(
                upperBound: questionArray.count));
         
    }
}
