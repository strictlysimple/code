//
//  QuestionStructure.swift
//  EnhanceQuizStarter
//
//  Created by Bojan Mitreski on 12/1/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

class Question {
    let question: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let corrAnswer: Int
    
    init(questionText: String, choiceA: String, choiceB: String, choiceC: String, choiceD: String, answer: Int){
        question = questionText
        optionA = choiceA
        optionB = choiceB
        optionC = choiceC
        optionD = choiceD
        corrAnswer = answer
    }
}
