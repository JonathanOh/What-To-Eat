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
    private var heightOfNavAndStatusBar: CGFloat {
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 64.0
        return statusBarHeight + navigationBarHeight
    }
    private var valueToSpaceCards: CGFloat {
        let visibleHeight: CGFloat = view.frame.height - heightOfNavAndStatusBar
        let heightOfAllCards: CGFloat = (view.frame.height/CGFloat(Rules.dishChoicesPerRound + 1)) * CGFloat(Rules.dishChoicesPerRound)
        let emptySpaceAvailable: CGFloat = visibleHeight - heightOfAllCards
        return emptySpaceAvailable / (CGFloat(Rules.dishChoicesPerRound) + 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view, typically from a nib.
        currentRound = RoundCreator(lastRoundResults: nil)
        guard let round = currentRound else { return }
        setupCardChoices(with: round)

    }
    
    func setupCardChoices(with round: RoundCreator) {
        var cardChoices = [DishCardView]()
        for x in 0..<Rules.dishChoicesPerRound {
            let card = DishCardView(dish: round.choiceOfDishesForUser[x], target: self, action: #selector(didPressCuisineButton(sender:)))
            cardChoices.append(card)
            view.addSubview(card)
            card.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
            let heightOfCard: CGFloat = DishCardView.heightOfCardWith(screenHeight: view.frame.height)
            card.heightAnchor.constraint(equalToConstant: heightOfCard).isActive = true
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            // Logic to space all cards evenly
            let bottomAnchorOfViewAbove = (x == 0 ? view.topAnchor : cardChoices[x-1].bottomAnchor)
            let topSpacing = (x == 0 ? valueToSpaceCards + heightOfNavAndStatusBar : valueToSpaceCards)
            card.topAnchor.constraint(equalTo: bottomAnchorOfViewAbove, constant: topSpacing).isActive = true
        }
    }
    
    func didPressCuisineButton(sender: DishCardView) {
        print("didPressCuisineButton \(sender.dish.dishName.rawValue)")
    }

    func roundSimulation(_ repeatx: Int = 1) {
        for _ in 0..<repeatx {
            guard let thisRound = currentRound else { return }
            print("Round: \(thisRound.roundNumber)")
            for dish in thisRound.choiceOfDishesForUser {
                print("choice of dishes for user: \(dish.dishName.rawValue)")
            }
            roundResults = RoundResults(roundNumber: thisRound.roundNumber, winningDish: thisRound.choiceOfDishesForUser[0], losingDishes: [thisRound.choiceOfDishesForUser[1], thisRound.choiceOfDishesForUser[2]], eligibleCuisines: thisRound.eligibleCuisines)
            if let winner = roundResults!.submitDataAndCleanUpRound() {
                let winnerVC = WinningVC()
                winnerVC.searchString = winner[0].searchString
                navigationController?.pushViewController(winnerVC, animated: true)
                return
            }
            currentRound = RoundCreator(lastRoundResults: roundResults)
            print("Cuisine Count: \(currentRound?.eligibleCuisines.count ?? -1)")
            for cuisine in thisRound.eligibleCuisines {
                print("Cuisine \(cuisine.cuisineType.rawValue) Loss Tally: \(cuisine.getTotalCuisineLosses(cuisine.topFiveFoods))")
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

