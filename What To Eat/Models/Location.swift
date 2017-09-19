//
//  Location.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/18/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

struct Location {
    let addressOne: String
    let addressTwo: String
    let addressThree: String
    let city: String
    let zipCode: String
    let country: String
    let state: String
    let displayAddress: [String]
    
    init?(json: [String:Any]) {
        guard let jsonAddressOne = json["address1"] as? String,
            let jsonAddressTwo = json["address2"] as? String,
            let jsonAddressThree = json["address3"] as? String,
            let jsonCity = json["city"] as? String,
            let jsonZipCode = json["zip_code"] as? String,
            let jsonCountry = json["country"] as? String,
            let jsonState = json["state"] as? String,
            let jsonDisplayAddress = json["display_address"] as? [String] else { return nil }
        self.addressOne = jsonAddressOne
        self.addressTwo = jsonAddressTwo
        self.addressThree = jsonAddressThree
        self.city = jsonCity
        self.zipCode = jsonZipCode
        self.country = jsonCountry
        self.state = jsonState
        self.displayAddress = jsonDisplayAddress
    }
}


//"location": {
//    "address1": "1570 Stockton St",
//    "address2": "",
//    "address3": "",
//    "city": "San Francisco",
//    "zip_code": "94133",
//    "country": "US",
//    "state": "CA",
//    "display_address": [
//    "1570 Stockton St",
//    "San Francisco, CA 94133"
//    ]
//},
