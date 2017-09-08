//
//  RoundResults.swift
//  What To Eat
//
//  Created by admin on 9/7/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class RoundResults {
    let roundNumber: Int
    let winningDish: Dish
    let losingDishes: [Dish]
    init(roundNumber: Int, winningDish: Dish, losingDishes: [Dish]) {
        self.roundNumber = roundNumber
        self.winningDish = winningDish
        self.losingDishes = losingDishes
    }
}
