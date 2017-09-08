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

struct DefaultValues {
    
    static let cuisines: [Cuisine] = [
        Cuisine(cuisineType: .american, topFiveFoods: [.burgers, .steak, .hotDog, .nachos, .frenchFries]),
        Cuisine(cuisineType: .korean, topFiveFoods: [.bibimbap, .bulgogi, .soontofu, .galbi, .nengmyun]),
        Cuisine(cuisineType: .chinese, topFiveFoods: [.orangeChicken, .chowFun, .broccoliBeef, .chineseSoup, .chineseNoodles]),
        Cuisine(cuisineType: .japanese, topFiveFoods: [.japaneseA, .japaneseB, .japaneseC, .japaneseD, .japaneseE]),
        Cuisine(cuisineType: .thai, topFiveFoods: [.thaiA, .thaiB, .thaiC, .thaiD, .thaiE]),
        Cuisine(cuisineType: .indian, topFiveFoods: [.indianA, .indianB, .indianC, .indianD, .indianE]),
        Cuisine(cuisineType: .italian, topFiveFoods: [.italianA, .italianB, .italianC, .italianD, .italianE]),
        Cuisine(cuisineType: .mexican, topFiveFoods: [.mexicanA, .mexicanB, .mexicanC, .mexicanD, .mexicanE]),
        Cuisine(cuisineType: .vietnamese, topFiveFoods: [.vietnameseA, .vietnameseB, .vietnameseC, .vietnameseD, .vietnameseE]),
        Cuisine(cuisineType: .mediterranean, topFiveFoods: [.mediterraneanA, .mediterraneanB, .mediterraneanC,.mediterraneanD, .mediterraneanE]),
        Cuisine(cuisineType: .pizza, topFiveFoods: [.pizzaA, .pizzaB, .pizzaC, .pizzaD, .pizzaE]),
        Cuisine(cuisineType: .salad, topFiveFoods: [.saladA, .saladB, .saladC, .saladD, .saladE]),
        Cuisine(cuisineType: .deli, topFiveFoods: [.deliA, .deliB, .deliC, .deliD, .deliE]),
        Cuisine(cuisineType: .sushi, topFiveFoods: [.sushiA, .sushiB, .sushiC, .sushiD, .sushiE]),
        Cuisine(cuisineType: .fastFood, topFiveFoods: [.fastFoodA, .fastFoodB, .fastFoodC, .fastFoodD, .fastFoodE]),
        Cuisine(cuisineType: .noodles, topFiveFoods: [.noodlesA, .noodlesB, .noodlesC, .noodlesD, .noodlesE]),
        Cuisine(cuisineType: .seafood, topFiveFoods: [.seafoodA, .seafoodB, .seafoodC, .seafoodD, .seafoodE])
    ]
}
