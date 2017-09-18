//
//  RestaurantSearchRequest.swift
//  What To Eat
//
//  Created by admin on 9/12/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

// responsible for storing the end point we are requesting to
class RestaurantSearchRequest {
    
    enum SortChoice: String {
        case best_match
        case rating
        case review_count
        case distance
    }
    
    struct TestConstants {
        static let latitude: Double = 37.789196
        static let longitude: Double = -122.397491
        static let location: String = "140 new montgomery st 94105"
    }
    
    let endPoint = "/businesses/search"
    let openNow = "true"
    let sortBy: SortChoice = .rating
    let latitude: Double?
    let longitude: Double?
    let location: String?
    
    init(location: String?, latitude: Double?, longitude: Double?) {
        self.latitude = latitude
        self.longitude = longitude
        self.location = location
    }
    
    func send(_ endPoint: String, )
    
}

