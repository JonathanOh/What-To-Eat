//
//  Cuisine.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class Cuisine {

    let cuisineType: CuisineChoices
    let topFiveFoods: [Dish]
    private var isEligibleCuisine: Bool = true 
    
    init(cuisineType: CuisineChoices, topFiveFoods: [PossibleDishes]) {
        self.cuisineType = cuisineType
        self.topFiveFoods = topFiveFoods.map { Dish(dishName: $0, cuisine: cuisineType) }
    }
    
    func getTotalCuisineLosses(_ dishes: [Dish]) -> Int {
        return dishes.reduce(0) { $0 + $1.losingTally }
    }
    
    func getTotalCuisineWins(_ dishes: [Dish]) -> Int {
        return dishes.reduce(0) { $0 + $1.winningTally }
    }
    
}
