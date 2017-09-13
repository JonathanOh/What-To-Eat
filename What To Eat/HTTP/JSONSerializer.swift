//
//  JSONSerializer.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/12/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import Foundation

class JSONSerializer {
    
    static func getSerializedDictionaryFrom(data: Data) -> [String:Any]? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
            return json
        } catch let jsonError {
            print("we have a json serializing error: \(jsonError)")
            return nil
        }
    }
    
    static func getSerializedArrayFrom(data: Data) -> [[String:Any]]? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String:Any]]
            return json
        } catch let jsonError {
            print("we have a json serializing error: \(jsonError)")
            return nil
        }
    }

}
