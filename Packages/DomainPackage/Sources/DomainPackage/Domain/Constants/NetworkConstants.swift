//
//  NetworkConstants.swift
//  Created by swornim-shah on 02/10/2023.
//

import Foundation

public class NetworkConstants {
    
    public static let USER_NAME = "userName"
    public static let PASSWORD = "password"
}

/*Network request builder */
extension NetworkConstants {
    public enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    public enum ContentType: String {
        case json = "application/json"
    }
}
