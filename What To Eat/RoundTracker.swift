//
//  RoundTracker.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/7/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

// This class should be responsible for tracking the current round
class RoundTracker {

    private(set) var currentRound: Int = 1
    
    func submitEndOfRoundData() {
        roundCleanUp()
    }
    func roundCleanUp() {
        currentRound += 1
    }
    
}
