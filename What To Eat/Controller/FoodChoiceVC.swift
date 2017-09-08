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
        
        roundSimulation(15)
    }

    func roundSimulation(_ repeatx: Int = 1) {
        for _ in 0..<repeatx {
            guard let thisRound = currentRound else { return }
            print("Round: \(thisRound.roundNumber)")
            for dish in thisRound.choiceOfDishesForUser {
                print("choice of dishes for user: \(dish.dishName.rawValue)")
            }
            roundResults = RoundResults(roundNumber: thisRound.roundNumber, winningDish: thisRound.choiceOfDishesForUser[0], losingDishes: [thisRound.choiceOfDishesForUser[1], thisRound.choiceOfDishesForUser[2]], eligibleCuisines: thisRound.eligibleCuisines)
            roundResults!.submitDataAndCleanUpRound()
            currentRound = RoundCreator(lastRoundResults: roundResults)
            for cuisine in thisRound.eligibleCuisines {
                for dish in cuisine.topFiveFoods {
                    if dish.winningTally > 0 || dish.losingTally > 0 {
                        print("\(dish.dishName.rawValue): Won:\(dish.winningTally), Lost:\(dish.losingTally)")
                    }
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

