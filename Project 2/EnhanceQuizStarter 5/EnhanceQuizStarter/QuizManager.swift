//
//  Questions.swift
//  EnhanceQuizStarter
//
//  Created by Bojan Mitreski on 12/1/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit
import GameKit

class QuizManager{
    var questionArray = [Question]()
    init(){

questionArray.append(Question(questionText: "This was the only US President to serve more than two consecutive terms.", choiceA: "George Washington", choiceB: "Franklin D. Roosevelt", choiceC: "Woodrow Wilson", choiceD: "Andrew Jackson", answer: 2))
questionArray.append(Question(questionText: "Which of the following countries has the most residents?", choiceA: "Nigeria", choiceB: "Russia", choiceC: "Iran", choiceD: "Vietnam", answer: 1))
questionArray.append(Question(questionText: "In what year was the United Nations founded?", choiceA: "1918", choiceB: "1919", choiceC: "1945", choiceD: "1954", answer: 3))
questionArray.append(Question(questionText: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", choiceA: "Paris", choiceB: "Washington D.C.", choiceC: "New York City", choiceD: "Boston", answer: 3))
questionArray.append(Question(questionText: "Which nation produces the most oil?", choiceA: "Iran", choiceB: "Iraq", choiceC: "Brazil", choiceD: "Canada", answer: 4))
questionArray.append(Question(questionText: "Which country has most recently won consecutive World Cups in Soccer?", choiceA: "Italy", choiceB: "Brazil", choiceC: "Argentina", choiceD: "Spain", answer: 2))
questionArray.append(Question(questionText: "Which of the following rivers is longest?", choiceA: "Yangtze", choiceB: "Mississippi", choiceC: "Congo", choiceD: "Mekong", answer: 2))
questionArray.append(Question(questionText: "Which city is the oldest?", choiceA: "Mexico City", choiceB: "Cape Town", choiceC: "San Juan", choiceD: "Sydney", answer: 1))
}

}
