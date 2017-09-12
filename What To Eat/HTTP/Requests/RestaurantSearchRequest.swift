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
    
    enum sortChoice: String {
        case best_match
        case rating
        case review_count
        case distance
    }
    
    let endPoint = "/businesses/search"
    let openNow = "true"
    let sortBy: sortChoice = .rating
    let latitude: Double?
    let longitude: Double?
    let location: String?
    
    init(location: String?, latitude: Double?, longitude: Double?) {
        
    }
    
}

