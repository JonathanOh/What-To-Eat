//
//  FoodChoiceVC
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import UIKit

class FoodChoiceVC: UIViewController {
    
    let animationOffset: CGFloat = 1000.0

    private var roundResults: RoundResults?
    private var currentRound: RoundCreator?
    private var cardChoiceViews = [DishCardView]()
    private var topConstraintOfCards = [NSLayoutConstraint]()
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for constraint in topConstraintOfCards {
            constraint.constant = constraint.constant - animationOffset
        }
        UIView.animate(withDuration: 1.0) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
    func setupCardChoices(with round: RoundCreator) {
        removeFoodCardsFromViewAndArray()
        topConstraintOfCards.removeAll()
        for x in 0..<Rules.dishChoicesPerRound {
            let card = DishCardView(dish: round.choiceOfDishesForUser[x], target: self, action: #selector(didPressCuisineButton(sender:)))
            cardChoiceViews.append(card)
            view.addSubview(card)
            card.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
            let heightOfCard: CGFloat = DishCardView.heightOfCardWith(screenHeight: view.frame.height)
            card.heightAnchor.constraint(equalToConstant: heightOfCard).isActive = true
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            // Top card will constrain according to status bar + nav bar + fixed spacing.  Next cards will constrain to fixed spacing to cards shown above it.
            let bottomAnchorOfViewAbove = (x == 0 ? view.topAnchor : cardChoiceViews[x-1].bottomAnchor)
            let topSpacing = (x == 0 ? valueToSpaceCards + heightOfNavAndStatusBar : valueToSpaceCards)
            let topAnchorConstraint = card.topAnchor.constraint(equalTo: bottomAnchorOfViewAbove, constant: topSpacing + animationOffset)
            topAnchorConstraint.isActive = true
            topConstraintOfCards.append(topAnchorConstraint)
        }
    }
    
    func removeFoodCardsFromViewAndArray() {
        if !cardChoiceViews.isEmpty {
            for viewIndex in stride(from: cardChoiceViews.count-1, through: 0, by: -1) {
                cardChoiceViews[viewIndex].removeFromSuperview()
            }
        }
        cardChoiceViews.removeAll()
    }
    
    func didPressCuisineButton(sender: DishCardView) {
        print("didPressCuisineButton \(sender.dish.dishName.rawValue)")
        guard let thisRound = currentRound else {
            print("We do not have a valid round didPressCuisineButton")
            return
        }
        
        roundResults = submitRoundResults(thisRound, winningDish: sender.dish)
        if !isThereAWinner() {
            currentRound = RoundCreator(lastRoundResults: roundResults)
            setupCardChoices(with: currentRound!)
        }
    }
    
    func submitRoundResults(_ currentRound: RoundCreator, winningDish: Dish) -> RoundResults {
        return RoundResults(roundNumber: currentRound.roundNumber,
                            winningDish: winningDish,
                            losingDishes: currentRound.choiceOfDishesForUser.filter { $0.dishName != winningDish.dishName },
                            eligibleCuisines: currentRound.eligibleCuisines)
    }
    
    //TODO: Pass in roundResults?.submitDataAndClean... add logic to handle an array of winner maybe?
    func isThereAWinner() -> Bool {
        if let winnerExists = roundResults?.submitDataAndCleanUpRound() {
            let winnerVC = WinningVC()
            winnerVC.searchString = winnerExists[0].searchString
            navigationController?.pushViewController(winnerVC, animated: true)
            return true
        }
        return false
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

