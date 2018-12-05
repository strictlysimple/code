//
//  Sound.swift
//  EnhanceQuizStarter
//
//  Created by Bojan Mitreski on 12/5/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import GameKit
import UIKit


struct Sound {
    var gameSound: SystemSoundID = 0

    mutating func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}
