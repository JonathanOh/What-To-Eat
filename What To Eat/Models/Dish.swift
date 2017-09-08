//
//  Dish.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class Dish {
    
    private(set) var winningTally: Int = 0
    private(set) var losingTally: Int = 0
    let dishName: PossibleDishes
    let cuisine: CuisineChoices
    //let images: [String]
    
    init(dishName: PossibleDishes, cuisine: CuisineChoices) {
        self.dishName = dishName
        self.cuisine = cuisine
    }
    
    func wonRound() {
        winningTally += 1
    }
    
    func lostRound() {
        losingTally += 1
    }
    
    func resetTallies() {
        winningTally = 0
        losingTally = 0
    }
}
