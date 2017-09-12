//
//  DishCardViewManager.swift
//  What To Eat
//
//  Created by admin on 9/11/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import UIKit

class DishCardViewManager {
    
    private var cardViewsA = [DishCardView]()
    private var cardViewsATopConstraints = [NSLayoutConstraint]()
    private var cardViewsB = [DishCardView]()
    private var cardViewsBTopConstraints = [NSLayoutConstraint]()
    private(set) var isAnimating: Bool = false
    
    func setAllButtonsEnabled(_ isEnabled: Bool) {
        if isEnabled {
            isAnimating = false
            _ = cardViewsA.map { $0.isUserInteractionEnabled = true }
            _ = cardViewsB.map { $0.isUserInteractionEnabled = true }
        } else {
            isAnimating = true
            _ = cardViewsA.map { $0.isUserInteractionEnabled = false }
            _ = cardViewsB.map { $0.isUserInteractionEnabled = false }
        }
    }
    
    func getIncomingCardViewWith(roundNumber: Int) -> [DishCardView] {
        return roundNumber % 2 == 0 ? cardViewsB : cardViewsA
    }
    
    func getIncomingTopConstraintsWith(roundNumber: Int) -> [NSLayoutConstraint] {
        return roundNumber % 2 == 0 ? cardViewsBTopConstraints : cardViewsATopConstraints
    }
    
    func addDishCardViewFor(roundNumber: Int, dishView: DishCardView) {
        if roundNumber % 2 == 0 {
            cardViewsB.append(dishView)
        } else {
            cardViewsA.append(dishView)
        }
    }

    func addDishCardViewTopConstraintFor(roundNumber: Int, topConstraint: NSLayoutConstraint) {
        if roundNumber % 2 == 0 {
            cardViewsBTopConstraints.append(topConstraint)
        } else {
            cardViewsATopConstraints.append(topConstraint)
        }
    }
    
    func removeDishViewsFor(roundNumber: Int) {
        if roundNumber % 2 == 0 {
            for index in stride(from: cardViewsB.count - 1, through: 0, by: -1) {
                cardViewsB[index].removeFromSuperview()
            }
            cardViewsB.removeAll()
        } else {
            for index in stride(from: cardViewsA.count - 1, through: 0, by: -1) {
                cardViewsA[index].removeFromSuperview()
            }
            cardViewsA.removeAll()
        }
    }
    
    func removeTopConstraintsFor(roundNumber: Int) {
        if roundNumber % 2 == 0 {
            cardViewsBTopConstraints.removeAll()
        } else {
            cardViewsATopConstraints.removeAll()
        }
    }
    
    func removeDishViewsAndTopConstraintsFor(roundNumber: Int) {
        removeDishViewsFor(roundNumber: roundNumber)
        removeTopConstraintsFor(roundNumber: roundNumber)
    }
    
    func removeAll() {
        removeDishViewsAndTopConstraintsFor(roundNumber: 1)
        removeDishViewsAndTopConstraintsFor(roundNumber: 2)
    }
    
}
