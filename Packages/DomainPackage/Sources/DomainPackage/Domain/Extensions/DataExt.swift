//
//  DataExt.swift
//
//
//  Created by swornim-shah on 14/10/2023.
//

import Foundation

public extension Data {
    
    func toPreetyString() -> String? {
        if let jsonObject = try? JSONSerialization.jsonObject(with: self, options: .allowFragments),
           let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
        
        return nil
    }
}
