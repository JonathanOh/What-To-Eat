//
//  WinChecker.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/7/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

// If nil is returned, there is no winning dish/cuisine just yet.  Rounds go on.
class WinChecker {
    
    // if dish gets +2, search dish string, should be checked as user selects a dish
    static func getWinnerByDish(_ dish: Dish) -> Dish? {
        return dish.winningTally >= Rules.Victory.dishWinValue ? dish : nil
    }
    
    // if cuisine gets 3, search cuisine string
    static func getWinnerByCuisine(_ cuisines: [Cuisine]) -> Cuisine? {
        for cuisine in cuisines {
            if cuisine.getTotalCuisineWins(cuisine.topFiveFoods) >= Rules.Victory.cuisineWinValue {
                return cuisine
            }
        }
        return nil
    }
    
    // if round 15, random dish out of all the highest point dishes
    // TODO: Logic to return all tied cuisines.  Currently only returning first cuisine to hit 2 win tallies
    static func getWinnerByMaxRound(_ cuisines: [Cuisine], round: Int) -> [Cuisine]? {
        if round <= Rules.maximumNumberOfRounds { return nil }
        for cuisine in cuisines {
            if cuisine.getTotalCuisineWins(cuisine.topFiveFoods) >= 2 {
                return [cuisine]
            }
        }
        return nil
    }
    
    static func determineWinnerFrom(roundResults: RoundResults) -> [Winner]? {
        if let dishWinner = getWinnerByDish(roundResults.winningDish) {
            return [Winner(dish: dishWinner)]
        }
        if let cuisineWinner = getWinnerByCuisine(roundResults.eligibleCuisines) {
            return [Winner(cuisine: cuisineWinner)]
        }
        if let endOfRoundWinner = getWinnerByMaxRound(roundResults.eligibleCuisines, round: roundResults.roundNumber) {
            return endOfRoundWinner.map { Winner(cuisine: $0) }
        }
        return nil
    }
}
