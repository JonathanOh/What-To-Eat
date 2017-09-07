//
//  FoodTrackingSessionTests.swift
//  What To EatTests
//
//  Created by Jonathan Oh on 9/7/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import XCTest

class FoodTrackingSessionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCurrentWinner() {
        let bibimbap: Dish = Dish(dishName: .bibimbap, cuisine: [.korean])
        let burgers: Dish = Dish(dishName: .burgers, cuisine: [.american])
        let chowFun: Dish = Dish(dishName: .chowFun, cuisine: [.chinese])
        
        let dishArray: [Dish] = [bibimbap, burgers, chowFun]
        
        let sessionOne: FoodTrackingSession = FoodTrackingSession(possibleFoods: dishArray)
        XCTAssert(sessionOne.currentWinner([]).isEmpty)
        XCTAssert(sessionOne.currentWinner(dishArray).isEmpty)
        bibimbap.wonRound()
        XCTAssert(sessionOne.currentWinner(dishArray)[0].winningTally == 1)
        XCTAssert(sessionOne.currentWinner(dishArray)[0] === bibimbap)
        burgers.wonRound()
        XCTAssert(sessionOne.currentWinner(dishArray)[0].winningTally == 1)
        XCTAssert(sessionOne.currentWinner(dishArray).count == 2)
        burgers.wonRound()
        chowFun.lostRound()
        XCTAssert(sessionOne.currentWinner(dishArray)[0] === burgers)
        XCTAssert(sessionOne.currentWinner(dishArray).count == 1)
        XCTAssert(!sessionOne.currentWinner(dishArray).isEmpty)
        XCTAssert(sessionOne.currentWinner(dishArray)[0].winningTally == 2)
        
    }
}
