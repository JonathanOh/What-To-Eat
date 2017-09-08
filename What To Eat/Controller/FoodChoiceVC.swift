//
//  FoodChoiceVC
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import UIKit

class FoodChoiceVC: UIViewController {

    private var roundResults: RoundResults?
    private var currentRound: RoundCreator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentRound = RoundCreator(lastRoundResults: nil)
        view.backgroundColor = .red
        guard var currentRound = currentRound else { return }
        for cuisine in currentRound.eligibleCuisines {
            print(cuisine.cuisineType.rawValue)
            print(cuisine.winningTally)
            //for dish in cuisine.topFiveFoods {
                //print(dish.dishName.rawValue)
            //}
        }
        print(currentRound.roundNumber)
        
        for dish in currentRound.choiceOfDishesForUser {
            print("choice of dishes for user: \(dish.dishName.rawValue)")
        }
        
        roundResults = RoundResults(roundNumber: currentRound.roundNumber, winningDish: currentRound.choiceOfDishesForUser[0], losingDishes: [currentRound.choiceOfDishesForUser[1], currentRound.choiceOfDishesForUser[2]], eligibleCuisines: currentRound.eligibleCuisines)
        roundResults?.submitDataAndCleanUpRound()
        currentRound = RoundCreator(lastRoundResults: roundResults)
        
        for cuisine in currentRound.eligibleCuisines {
            //print(cuisine.cuisineType.rawValue)
            //print(cuisine..winningTally)
            //print(cuisine.losingTally)
            for dish in cuisine.topFiveFoods {
                print("\(dish.dishName.rawValue): Won:\(dish.winningTally), Lost:\(dish.losingTally)")
            }
        }
        print(currentRound.roundNumber)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

