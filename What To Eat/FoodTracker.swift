//
//  FoodTracker.swift
//  What To Eat
//
//  Created by admin on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class FoodTrackingSession {

    let possibleFoods: [Cuisine]
    private var currentWinner: [Cuisine] = []
    
    init(possibleFoods: [Cuisine]) {
        self.possibleFoods = possibleFoods
    }
    
    func resultOfRound(_ winner: Cuisine, losers: [Cuisine]) {
        winner.wonRound()
        _ = losers.map { $0.lostRound() }
    }

}
