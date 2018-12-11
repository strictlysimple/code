//
//  QuestionStructure.swift
//  EnhanceQuizStarter
//
//  Created by Bojan Mitreski on 12/1/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

class Question {
    let question:String;
    let options: [String];
    let correctAnswer: Int;
    
    init(question:String, options: [String], correctAnswer: Int) {
        
        self.question = question;
        self.options = options;
        self.correctAnswer = correctAnswer;
    }
}
