//
//  Dish.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class Dish: WinTracker {
    
    let dishName: PossibleDishes
    let cuisine: [CuisineChoices]
    //let images: [String]
    
    init(dishName: PossibleDishes, cuisine: [CuisineChoices]) {
        self.dishName = dishName
        self.cuisine = cuisine
    }
    
}
