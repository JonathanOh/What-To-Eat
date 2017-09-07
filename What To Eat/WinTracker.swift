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
    private(set) var losingTally: Int = 0 {
        didSet {
            if losingTally == 2 {
                // Notify others to remove this from eligible participant
            }
        }
    }
    
    func wonRound() {
        winningTally += 1
    }
    
    func lostRound() {
        losingTally += 1
    }
    
    func resetWinningTally() {
        winningTally = 0
    }
    
}
