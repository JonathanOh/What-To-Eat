//
//  Constants.swift
//  What To Eat
//
//  Created by admin on 9/7/
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
        Cuisine(cuisineType: .american, topFiveFoods: [.americanBurgers, .americanSteak, .americanHotDog, .americanNachos, .americanFriedChicken]),
        Cuisine(cuisineType: .korean, topFiveFoods: [.koreanBibimbap, .koreanJapchae, .koreanSoontofu, .koreanGalbi, .koreanJajangmyeon]),
        Cuisine(cuisineType: .chinese, topFiveFoods: [.chineseChowMein, .chineseSweetAndSourChicken, .chineseSteamedDumplings, .chineseFriedRice, .chineseKungPaoChicken]),
        Cuisine(cuisineType: .japanese, topFiveFoods: [.japaneseUdon, .japaneseRamen, .japaneseChickenKatsu, .japaneseGyudon, .japaneseMisoSoup]),
        Cuisine(cuisineType: .thai, topFiveFoods: [.thaiPadThai, .thaiPadSeeEw, .thaiYellowCurry, .thaiGreenPapayaSalad, .thaiRedCurry]),
        Cuisine(cuisineType: .indian, topFiveFoods: [.indianButterChicken, .indianTandooriChicken, .indianChickenTikkaMasala, .indianSamosa, .indianLambVindaloo]),
        Cuisine(cuisineType: .italian, topFiveFoods: [.italianChickenParmigiana, .italianFettuccineAlfredo, .italianLasagna, .italianSpaghetti, .italianLinguine]),
        Cuisine(cuisineType: .mexican, topFiveFoods: [.mexicanBurrito, .mexicanTaco, .mexicanEnchilada, .mexicanChilaquiles, .mexicanTamales]),
        Cuisine(cuisineType: .vietnamese, topFiveFoods: [.vietnamesePho, .vietnameseBanhMi, .vietnameseSpringRolls, .vietnameseFiveSpiceChicken, .vietnameseEBBQPorkOverRice]),
        Cuisine(cuisineType: .mediterranean, topFiveFoods: [.mediterraneanSpanakopita, .mediterraneanBabaGhanoush, .mediterraneanGyro, .mediterraneanShawarma, .mediterraneanFalafel]),
        Cuisine(cuisineType: .pizza, topFiveFoods: [.pizzaPepperoniPizza, .pizzaDeepDishPizza, .pizzaChicagoStylePizza, .pizzaSupremePizza, .pizzaHawaiianPizza]),
        Cuisine(cuisineType: .salad, topFiveFoods: [.saladA, .saladB, .saladC, .saladD, .saladE]),
        Cuisine(cuisineType: .deli, topFiveFoods: [.deliA, .deliB, .deliC, .deliD, .deliE]),
        Cuisine(cuisineType: .sushi, topFiveFoods: [.sushiA, .sushiB, .sushiC, .sushiD, .sushiE]),
        Cuisine(cuisineType: .fastFood, topFiveFoods: [.fastFoodMcdonalds, .fastFoodKFC, .fastFoodTacoBell, .fastFoodJackInTheBox, .fastFoodInNOut]),
        Cuisine(cuisineType: .noodles, topFiveFoods: [.noodlesA, .noodlesB, .noodlesC, .noodlesD, .noodlesE]),
        Cuisine(cuisineType: .seafood, topFiveFoods: [.seafoodA, .seafoodB, .seafoodC, .seafoodD, .seafoodE])
    ]
}

struct APIKeys {
    static let yelpClientID = "wpNIOEcOyUfL2rtQHVtyhQ"
    static let yelpClientSecret = "SCGM0UvLNmqJMpGNYNZkH4W04vosTuulgc2l2Ff6aGeS0zkBnd2uw3gavTsgHVuD"
}
