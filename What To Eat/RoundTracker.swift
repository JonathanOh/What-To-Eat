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
    struct Constants {
        static let maximumNumberOfRounds: Int = 15
        static let foodChoicePerRound: Int = 3
    }
    private(set) var currentRound: Int = 1
    
    func getDishFor(round: Int, eligibleCuisines: [Cuisine]) -> [Dish] {
        return []
    }
    
}
