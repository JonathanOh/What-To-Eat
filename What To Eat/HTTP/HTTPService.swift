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
    private var token: Token?
    
    func getRequestForURL(_ url: URL) -> URLRequest {
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token?.accessToken ?? "")", forHTTPHeaderField: "Authorization")
        return request
    }
    
    func refreshTokenIfNeeded(_ clientId: String, clientSecret: String) {
        if let nonNilToken = token {
            if nonNilToken.expirationDate > Date() { return }
        }
        guard let url = URL(string: "https://api.yelp.com/oauth2/token?client_id=\(clientId)&client_secret=\(clientSecret)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { (data, urlresponse, error) in
            if let err = error { print("we have an error: \(err)") }
            guard let data = data,
                let jsonDict = JSONSerializer.getSerializedDictionaryFrom(data: data) else { return }
            self.token = Token(json: jsonDict)
        }.resume()
    }
    
    func requestJSONArray(_ endPoint: String, response: @escaping ([[String:Any]]) -> Void) {
        // Construct an endpoint and send the request off
        guard let url = URL(string: endPoint) else { return }
        let request = getRequestForURL(url)
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let err = error {
                print("Error!!: \(err)")
            }
            if let data = data {
                guard let json = JSONSerializer.getSerializedArrayFrom(data: data) else { return }
                response(json)
            }
        }.resume()
    }
    
    func requestJSONDictionary(_ endPoint: String, response: @escaping ([String:Any]) -> Void) {
        guard let url = URL(string: endPoint) else { return }
        let request = getRequestForURL(url)
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let data = data {
                guard let json = JSONSerializer.getSerializedDictionaryFrom(data: data) else { return }
                response(json)
            }
        }.resume()
    }
    
}
