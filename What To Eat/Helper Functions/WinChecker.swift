//
//  WinChecker.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/7/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class WinChecker {
    
    // if dish gets +2, search dish string
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
    static func getWinnerByMaxRound(_ cuisines: [Cuisine], round: Int) -> [Cuisine]? {
        if round <= Rules.maximumNumberOfRounds { return nil }
        return nil
    }
}
