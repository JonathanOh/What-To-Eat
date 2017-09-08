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
    
    private(set) var eligibleCuisinesForRound: [Cuisine]
    
    init(eligibleCuisinesForRound: [Cuisine]) {
        self.eligibleCuisinesForRound = eligibleCuisinesForRound
    }
    
    private func checkCuisinesToDisqualify(byCuisines: [Cuisine]) -> [Cuisine] {
        return byCuisines.filter { $0.losingTally <= Constants.maxAllowedCuisineLosses }
    }
    
    private func updateEligibleCuisines() {
        eligibleCuisinesForRound = checkCuisinesToDisqualify(byCuisines: eligibleCuisinesForRound)
    }
    
    func getRandomDishesFrom(_ dishes: [Dish], amountOfDishesToReturn: Int) -> [Dish] {
        if dishes.count > amountOfDishesToReturn { return [] }
        var dishesToReturn: [Dish] = []
        var indexTracker: [Int] = []
        while dishesToReturn.count < amountOfDishesToReturn {
            let randomNumber = amountOfDishesToReturn.randomNumberWithSelfAsMaximum()
            if !indexTracker.contains(randomNumber) {
                indexTracker.append(randomNumber)
                dishesToReturn.append(dishes[randomNumber])
            }
        }
        return dishesToReturn
    }
    
    func getDishChoiceFromEligibleCuisines(_ cuisines:[Cuisine], amountOfDishesToReturn: Int) -> [Dish] {
        let eligibleCuisines = checkCuisinesToDisqualify(byCuisines: cuisines)
        if eligibleCuisines.count > amountOfDishesToReturn {
            return []
        } else {
            let dishes =  eligibleCuisines.map { cuisine -> Dish in
                let randomNumber = Dish.Constants.maxAmountOfDishes.randomNumberWithSelfAsMaximum()
                return cuisine.topFiveFoods[randomNumber]
            }
            return getRandomDishesFrom(dishes, amountOfDishesToReturn: amountOfDishesToReturn)
        }
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
