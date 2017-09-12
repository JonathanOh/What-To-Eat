//
//  DishCardViewManager.swift
//  What To Eat
//
//  Created by admin on 9/11/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import UIKit

class DishCardViewModel {
    
    private var cardViewsA = [DishCardView]()
    private var cardViewsATopConstraints = [NSLayoutConstraint]()
    private var cardViewsB = [DishCardView]()
    private var cardViewsBTopConstraints = [NSLayoutConstraint]()
    
    func getCardViewWith(roundNumber: Int) -> [DishCardView] {
        return roundNumber % 2 == 0 ? cardViewsB : cardViewsA
    }
    
    func storeDishCardViewsFor(roundNumber: Int, dishViews: [DishCardView]) {
        if roundNumber % 2 == 0 {
            cardViewsB = dishViews
        } else {
            cardViewsA = dishViews
        }
    }
    
    func storeDishCardViewTopConstraintsFor(roundNumber: Int, topConstraints: [NSLayoutConstraint]) {
        if roundNumber % 2 == 0 {
            cardViewsBTopConstraints = topConstraints
        } else {
            cardViewsATopConstraints = topConstraints
        }
    }
    
    func storeViewAndTopConstraintsFor(roundNumber: Int, dishViews: [DishCardView], topConstraints: [NSLayoutConstraint]) {
        storeDishCardViewsFor(roundNumber: roundNumber, dishViews: dishViews)
        storeDishCardViewTopConstraintsFor(roundNumber: roundNumber, topConstraints: topConstraints)
    }
    
    func removeDishViewsFor(roundNumber: Int, inView: UIView) {
        if roundNumber % 2 == 0 {
            for x in stride(from: cardViewsA.count - 1, through: 0, by: -1) {
                cardViewsA[x].removeFromSuperview()
            }
            cardViewsA.removeAll()
        } else {
            for x in stride(from: cardViewsA.count - 1, through: 0, by: -1) {
                cardViewsB[x].removeFromSuperview()
            }
            cardViewsB.removeAll()
        }
    }
    
    func removeTopConstraintsFor(roundNumber: Int) {
        if roundNumber % 2 == 0 {
            cardViewsATopConstraints.removeAll()
        } else {
            cardViewsBTopConstraints.removeAll()
        }
    }
    
    func removeDishViewsAndTopConstraintsFor(roundNumber: Int, inView: UIView) {
        removeDishViewsFor(roundNumber: roundNumber, inView: inView)
        removeTopConstraintsFor(roundNumber: roundNumber)
    }
    
}
