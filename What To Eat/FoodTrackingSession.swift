//
//  FoodTrackingSession.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class FoodTrackingSession {

    struct Constants {
        static let maximumLosingRounds: Int = 2
        static let numberOfUserChoices: Int = 3
    }
    
    let possibleFoods: [Dish]
    
    init(possibleFoods: [Dish]) {
        self.possibleFoods = possibleFoods
    }
    
    func getRoundChoices(_ cuisines: [Dish]) -> [Dish] {
        // This is where we input logic to choose 3 cuisines for user to choose from
        return possibleFoods
    }
    
    func resultOfRound(_ winner: Dish, losers: [Dish]) {
        winner.wonRound()
        _ = losers.map { $0.lostRound() }
    }
    
    func currentWinner(_ dishes: [Dish]) -> [Dish] {
        var currentWinners: [Dish] = []
        for dish in dishes {
            if currentWinners.isEmpty {
                if dish.winningTally > 0 {
                    currentWinners.append(dish)
                }
            } else {
                // We know currentWinners is not empty, compare first item to current iteration winningTally
                if currentWinners[0].winningTally == dish.winningTally {
                    currentWinners.append(dish)
                } else if currentWinners[0].winningTally < dish.winningTally {
                    currentWinners = [dish]
                }
            }
        }
        return currentWinners
    }

}
