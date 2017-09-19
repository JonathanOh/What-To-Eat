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
        static let fullEndpoint: String = "https://api.yelp.com/v3/businesses/search?location=%27140%20new%20montgomery%20st%2094105%27&term=%22pizza%22"
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
    
    func send(_ endPoint: String, businesses: @escaping ([Business]) -> Void) {
        HTTPService.shared.requestJSONArray(endPoint) { jsonOfBusinesses in
            var arrayOfBusiness = [Business]()
            for business in jsonOfBusinesses {
                guard let businessObject = Business(json: business) else { continue }
                arrayOfBusiness.append(businessObject)
            }
            businesses(arrayOfBusiness)
        }
    }
    
}

