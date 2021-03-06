//
//  FoodTracker.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

//  This class should be responsible for taking in results of the round and updating objects
class FoodTracker {
    
    static func checkCuisinesToDisqualify(byCuisines: [Cuisine]) -> [Cuisine] {
        return byCuisines.filter { $0.getTotalCuisineLosses($0.topFiveFoods) <= Rules.Disqualify.maxAllowedCuisineLosses }
    }

    static func getRandomDishesFrom(_ dishes: [Dish], amountOfDishesToReturn: Int) -> [Dish] {
        if dishes.count < amountOfDishesToReturn { return [] }
        var dishesToReturn: [Dish] = []
        var indexTracker: [Int] = []
        while dishesToReturn.count < amountOfDishesToReturn {
            let randomNumber = dishes.count.randomNumberWithSelfAsMaximum()
            if !indexTracker.contains(randomNumber) {
                indexTracker.append(randomNumber)
                dishesToReturn.append(dishes[randomNumber])
            }
        }
        return dishesToReturn
    }
    
    static func getDishChoiceFromEligibleCuisines(_ cuisines:[Cuisine], amountOfDishesToReturn: Int) -> [Dish] {
        let eligibleCuisines = checkCuisinesToDisqualify(byCuisines: cuisines)
        if eligibleCuisines.count < amountOfDishesToReturn {
            return []
        } else {
            let dishes =  eligibleCuisines.map { cuisine -> Dish in
                let randomNumber = Rules.maxDishesPerCuisine.randomNumberWithSelfAsMaximum()
                return cuisine.topFiveFoods[randomNumber]
            }
            return getRandomDishesFrom(dishes, amountOfDishesToReturn: amountOfDishesToReturn)
        }
    }
    
    static func resultOfRound(_ winner: Dish, losers: [Dish]) {
        winner.wonRound()
        _ = losers.map { $0.lostRound() }
    }
}
