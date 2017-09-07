//
//  Cuisine.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class Cuisine: WinTracker {

    let cuisineType: CuisineChoices
    let topFiveFoods: [Dish]
    
    init(cuisineType: CuisineChoices, topFiveFoods: [PossibleDishes]) {
        self.cuisineType = cuisineType
        self.topFiveFoods = topFiveFoods.map { Dish(dishName: $0) }
    }
}
