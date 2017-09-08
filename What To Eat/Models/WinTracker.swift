//
//  WinTracker.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/7/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class WinTracker {
 
    private(set) var winningTally: Int = 0
    private(set) var losingTally: Int = 0
    
    func wonRound() {
        winningTally += 1
    }
    
    func lostRound() {
        losingTally += 1
    }
    
    func resetTallies() {
        winningTally = 0
        losingTally = 0
    }
    
}
