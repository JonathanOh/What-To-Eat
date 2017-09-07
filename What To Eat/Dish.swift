//
//  Dish.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class Dish {
    
    struct Constants {
        static let maxAmountOfDishes: Int = 5
    }
    let dishName: PossibleDishes
    private(set) var winningTally: Int = 0

    //let cuisine: [CuisineChoices]
    //let images: [String]
    
    init(dishName: PossibleDishes) {
        self.dishName = dishName
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
