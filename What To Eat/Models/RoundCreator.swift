//
//  RoundCreator
//  What To Eat
//
//  Created by Jonathan Oh on 9/7/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

// This class should be responsible for tracking the current round
class RoundCreator {

    let eligibleCuisines: [Cuisine]
    let choiceOfDishesForUser: [Dish]
    let roundNumber: Int
    
    init(lastRoundResults: RoundResults?) {
        if let lastRound = lastRoundResults {
            self.roundNumber = lastRound.roundNumber + 1
            self.eligibleCuisines = FoodTracker.checkCuisinesToDisqualify(byCuisines: lastRound.eligibleCuisines)
            self.choiceOfDishesForUser = FoodTracker.getDishChoiceFromEligibleCuisines(self.eligibleCuisines, amountOfDishesToReturn: Rules.dishChoicesPerRound)
        } else {
            self.eligibleCuisines = DefaultValues.cuisines
            self.roundNumber = 1
            self.choiceOfDishesForUser = FoodTracker.getDishChoiceFromEligibleCuisines(self.eligibleCuisines, amountOfDishesToReturn: Rules.dishChoicesPerRound)
        }
    }
    
}
