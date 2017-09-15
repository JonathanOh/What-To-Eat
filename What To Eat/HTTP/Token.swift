//
//  Token.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/15/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class Token {
    let accessToken: String
    let tokenType: String
    let expirationDate: Date

    init?(json: [String:Any]) {
        guard let accessToken = json["access_token"] as? String,
            let tokenType = json["token_type"] as? String,
            let expiresIn = json["expires_in"] as? Int else { return nil }
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.expirationDate = Date(timeInterval: Double(expiresIn), since: Date())
    }
    
}
