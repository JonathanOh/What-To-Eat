//
//  Extensions.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/7/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

extension MutableCollection where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        for i in startIndex ..< endIndex - 1 {
            let randomIndex = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != randomIndex {
                swap(&self[i], &self[randomIndex])
            }
        }
    }
}

extension Int {
    func randomNumberWithSelfAsMaximum() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
