//
//  Constants.swift
//  What To Eat
//
//  Created by admin on 9/7/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

struct Rules {
    
    static let maxDishesPerCuisine: Int = 5
    static let dishChoicesPerRound: Int = 3
    static let maximumNumberOfRounds: Int = 15
    
    struct Victory {
        static let dishWinValue: Int = 2
        static let cuisineWinValue: Int = 3
    }
    
    struct Disqualify {
        static let maxAllowedCuisineLosses: Int = 2
    }
}
