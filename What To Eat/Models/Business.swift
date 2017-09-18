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
    let isCloser: Bool
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
}

//
//"id": "tonys-pizza-napoletana-san-francisco",
//"name": "Tony's Pizza Napoletana",
//"image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/d8tM3JkgYW0roXBygLoSKg/o.jpg",
//"is_closed": false,
//"url": "https://www.yelp.com/biz/tonys-pizza-napoletana-san-francisco?adjust_creative=wpNIOEcOyUfL2rtQHVtyhQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=wpNIOEcOyUfL2rtQHVtyhQ",
//"review_count": 3649,
//"categories": [
//{
//"alias": "pizza",
//"title": "Pizza"
//},
//{
//"alias": "italian",
//"title": "Italian"
//},
//{
//"alias": "cocktailbars",
//"title": "Cocktail Bars"
//}
//],
//"rating": 4,
//"coordinates": {
//    "latitude": 37.80032,
//    "longitude": -122.40894
//},
//"transactions": [],
//"price": "$$",
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
//"phone": "+14158359888",
//"display_phone": "(415) 835-9888",
//"distance": 1692.1801327639998
