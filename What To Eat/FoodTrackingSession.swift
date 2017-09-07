//
//  FoodTrackingSession.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

//  This class should be responsible for taking in results of the round and updating objects
class FoodTrackingSession {

    struct Constants {
        static let maximumLosingRounds: Int = 2
    }
    
    let possibleFoods: [Dish]
    
    init(possibleFoods: [Dish]) {
        self.possibleFoods = possibleFoods
    }
    
    func getRoundChoices(_ cuisines: [CuisineChoices]) -> [Dish] {
        // This is where we input logic to choose 3 cuisines for user to choose from
        return possibleFoods
    }
    
    func cuisineDidWin(_ cuisine: Cuisine) {
        // logic to trigger this cuisine winner
    }
    func dishDidWin(_ dish: Dish) {
        // logic ot trigger this dish winner
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
