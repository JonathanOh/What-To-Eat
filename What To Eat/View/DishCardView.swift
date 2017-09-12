//
//  DishCardView.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/8/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import UIKit

class DishCardView: UIButton {
    
    let testLabel = UILabel()
    let dish: Dish
    
    init(dish: Dish, target: Any?, action: Selector) {
        self.dish = dish
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(target, action: action, for: .touchUpInside)
        
        backgroundColor = .gray
        testLabel.text = "\(self.dish.dishName.rawValue)"
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.textAlignment = .center
        testLabel.backgroundColor = .blue
        testLabel.textColor = .white
        addSubview(testLabel)
        
        testLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        testLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        testLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        testLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static func heightOfCardWith(screenHeight: CGFloat) -> CGFloat {
        return screenHeight / CGFloat(Rules.dishChoicesPerRound + 1)
    }
    
}
