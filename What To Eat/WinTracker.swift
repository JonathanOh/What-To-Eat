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
    
    func wonRound() {
        winningTally += 1
    }
    
    func lostRound() {
        // Maybe no penalty for now
    }
    
    func resetWinningTally() {
        winningTally = 0
    }
    
}
