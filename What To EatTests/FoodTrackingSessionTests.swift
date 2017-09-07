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
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let korean: Cuisine = Cuisine(cuisineType: .korean, topFiveFoods: ["bibimbap", "bulgogi", "soondoobu"])
        let american: Cuisine = Cuisine(cuisineType: .american, topFiveFoods: ["burgers", "steak", "hot dogs"])
        let chinese: Cuisine = Cuisine(cuisineType: .chinese, topFiveFoods: ["orange chicken", "chow fun", "broccoli beef"])
        let cuisineArray: [Cuisine] = [korean, american, chinese]
        
        let sessionOne: FoodTrackingSession = FoodTrackingSession(possibleFoods: cuisineArray)
        
        XCTAssert(sessionOne.currentWinner(cuisineArray).isEmpty)
        korean.wonRound()
        XCTAssert(sessionOne.currentWinner(cuisineArray)[0].winningTally == 1)
        XCTAssert(sessionOne.currentWinner(cuisineArray)[0] === korean)
        american.wonRound()
        XCTAssert(sessionOne.currentWinner(cuisineArray)[0].winningTally == 1)
        XCTAssert(sessionOne.currentWinner(cuisineArray).count == 2)
        american.wonRound()
        chinese.lostRound()
        XCTAssert(sessionOne.currentWinner(cuisineArray)[0] === american)
        XCTAssert(sessionOne.currentWinner(cuisineArray).count == 1)
        XCTAssert(!sessionOne.currentWinner(cuisineArray).isEmpty)
        XCTAssert(sessionOne.currentWinner(cuisineArray)[0].winningTally == 2)
        
    }
}
