//
//  Sound.swift
//  EnhanceQuizStarter
//
//  Created by Bojan Mitreski on 12/5/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import AudioToolbox

struct Sound {
    
    private init() {}
    
    private static let gameSound: SystemSoundID = {
        let path = Bundle.main.url(forResource: "GameSound", withExtension: "wav")!
        var soundID: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(path as CFURL, &soundID)
        return soundID
    }()

    static func playGameSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}
