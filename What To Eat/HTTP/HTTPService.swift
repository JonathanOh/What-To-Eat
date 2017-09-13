//
//  HTTPService.swift
//  What To Eat
//
//  Created by admin on 9/12/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

// takes an endpoint from a request object and can send and serialize request/responses
class HTTPService {
    static let shared = HTTPService()
    private var accessToken: String?
    private let tokenType = "Bearer"
    
    func getAccessToken(_ clientId: String, clientSecret: String) -> String? {
        guard let url = URL(string: "https://api.yelp.com/oauth2/token?client_id=\(clientId)&client_secret=\(clientSecret)") else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { (data, urlresponse, error) in
            if let err = error { print("we have an error: \(err)") }
            guard let data = data else {
                print("data is nil")
                return
            }
            guard let jsonDict = JSONSerializer.getSerializedDictionaryFrom(data: data) else { return }
            // create token object to map the response instead.
            self.accessToken = jsonDict["access_token"] as? String
        }.resume()
        return ""
    }
    
    func request(_ endPoint: String) -> [String:Any] {
        // Construct an endpoint and send the request off
        return [String:Any]()
    }
    
}

// If any request fails, we must attempt to refresh access token once before giving up

/*
 https://api.yelp.com/oauth2/token?client_id=wpNIOEcOyUfL2rtQHVtyhQ&client_secret=SCGM0UvLNmqJMpGNYNZkH4W04vosTuulgc2l2Ff6aGeS0zkBnd2uw3gavTsgHVuD
 */
