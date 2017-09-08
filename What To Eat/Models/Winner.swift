//
//  Winner.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/8/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class Winner {
    let searchString: String
    init(dish: Dish) {
        self.searchString = dish.dishName.rawValue
    }
    init(cuisine: Cuisine) {
        self.searchString = cuisine.cuisineType.rawValue
    }
}
