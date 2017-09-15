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
    let expiresIn: Int
    let currentTime: Date
    
    init(accessToken: String, tokenType: String, expiresIn: Int) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.expiresIn = expiresIn
        self.currentTime = Date()
    }
}
