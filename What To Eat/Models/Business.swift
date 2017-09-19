//
//  Business.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/18/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

struct Business {
    let id: String
    let name: String
    let imageURL: String
    let isClosed: Bool
    let yelpURL: String
    let reviewCount: Int
    //let categories: [Category]
    let rating: Int
    let latitude: Double
    let longitude: Double
    let price: String
    let location: Location
    let phone: String
    let displayPhone: String
    let distance: Double
    let errorString = "Could not get JSON"
    
    init?(json: [String:Any]) {
        guard let jsonId = json["id"] as? String,
            let jsonName = json["name"] as? String,
            let jsonImageURL = json["image_url"] as? String,
            let jsonIsClosed = json["is_closed"] as? Bool,
            let jsonYelpURL = json["url"] as? String,
            let jsonReviewCount = json["review_count"] as? Int,
            let jsonRating = json["rating"] as? Int,
            let jsonLatitude = (json["coordinates"] as? [String:Any])?["latitude"] as? Double,
            let jsonLongitude = (json["coordinates"] as? [String:Any])?["longitude"] as? Double,
            let jsonPrice = json["price"] as? String,
            let jsonLocation = json["location"] as? [String:Any],
            let jsonPhone = json["phone"] as? String,
            let jsonDisplayPhone = json["display_phone"] as? String,
            let jsonDistance = json["distance"] as? Double else {
            return nil
        }
        self.id = jsonId
        self.name = jsonName
        self.imageURL = jsonImageURL
        self.isClosed = jsonIsClosed
        self.yelpURL = jsonYelpURL
        self.reviewCount = jsonReviewCount
        self.rating = jsonRating
        self.latitude = jsonLatitude
        self.longitude = jsonLongitude
        self.price = jsonPrice
        guard let businessLocation = Location(json: jsonLocation) else { return nil }
        self.location = businessLocation
        self.phone = jsonPhone
        self.displayPhone = jsonDisplayPhone
        self.distance = jsonDistance
    }
}
