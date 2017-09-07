//
//  Cuisine.swift
//  What To Eat
//
//  Created by admin on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class Cuisine {

    let cuisineType: CuisineChoices
    let topFiveFoods: [Dish]
    private(set) var winningTally: Int = 0

    init(cuisineType: CuisineChoices, topFiveFoods: [String]) {
        self.cuisineType = cuisineType
        self.topFiveFoods = topFiveFoods.map { Dish(dishName: $0) }
    }
    
    func wonRound() {
        winningTally += 1
    }
    
    func lostRound() {
        // Maybe no penalty for now
    }
    
    func resetWinningTally() {
        winningTally = 0
    }
}
