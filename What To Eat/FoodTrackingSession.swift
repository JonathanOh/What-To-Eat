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
        static let maxAllowedCuisineLosses: Int = 2
        static let dishChoicesPerRound: Int = 3
    }
    
    private var eligibleCuisinesForRound: [Cuisine]
    
    init(eligibleCuisinesForRound: [Cuisine]) {
        self.eligibleCuisinesForRound = eligibleCuisinesForRound
    }
    
    private func checkCuisinesToDisqualify(byCuisines: [Cuisine]) -> [Cuisine] {
        return byCuisines.filter { $0.losingTally <= Constants.maxAllowedCuisineLosses }
    }
    
    private func updateEligibleCuisines() {
        eligibleCuisinesForRound = checkCuisinesToDisqualify(byCuisines: eligibleCuisinesForRound)
    }
    
    func getDishChoiceFromEligibleCuisines(_ cuisines:[Cuisine], amountOfDishesToReturn: Int) -> [Dish] {
        let eligibleCuisines = checkCuisinesToDisqualify(byCuisines: cuisines)
        if eligibleCuisines.count > amountOfDishesToReturn {
            return []
        } else {
            return eligibleCuisines.map { cuisine -> Dish in
                let randomNumber: Int = Int(arc4random_uniform(UInt32(Dish.Constants.maxAmountOfDishes)))
                return cuisine.topFiveFoods[randomNumber]
            }
        }
    }
    
    func getRoundChoices(_ cuisines: [CuisineChoices]) -> [Dish] {
        // This is where we input logic to choose 3 cuisines for user to choose from
        return []
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
