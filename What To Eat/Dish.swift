//
//  Dish.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class Dish: WinTracker {
    
    struct Constants {
        static let maxAmountOfDishes: Int = 5
    }
    let dishName: PossibleDishes

    //let cuisine: [CuisineChoices]
    //let images: [String]
    
    init(dishName: PossibleDishes) {
        self.dishName = dishName
    }
    
}
