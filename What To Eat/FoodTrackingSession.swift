//
//  FoodTrackingSession.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class FoodTrackingSession {

    let possibleFoods: [Cuisine]
    //private var currentWinner: [Cuisine] = []
    
    init(possibleFoods: [Cuisine]) {
        self.possibleFoods = possibleFoods
    }
    
    func getRoundChoices(_ cuisines: [Cuisine]) -> [Cuisine] {
        // This is where we input logic to choose 3 cuisines for user to choose from
        return possibleFoods
    }
    
    func resultOfRound(_ winner: Cuisine, losers: [Cuisine]) {
        winner.wonRound()
        _ = losers.map { $0.lostRound() }
    }
    
    func currentWinner(_ cuisines: [Cuisine]) -> [Cuisine] {
        var currentWinners: [Cuisine] = []
        for cuisine in cuisines {
            if currentWinners.isEmpty {
                if cuisine.winningTally > 0 {
                    currentWinners.append(cuisine)
                }
            } else {
                // We know currentWinners is not empty, compare first item to current iteration winningTally
                if currentWinners[0].winningTally == cuisine.winningTally {
                    currentWinners.append(cuisine)
                } else if currentWinners[0].winningTally < cuisine.winningTally {
                    currentWinners = [cuisine]
                }
            }
        }
        return currentWinners
    }

}
