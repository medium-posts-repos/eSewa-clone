//
//  File.swift
//  
//
//  Created by swornim-shah on 17/03/2023.
//

import Foundation
import Alamofire

final class NetworkApiMonitor: EventMonitor {
    let queue = DispatchQueue(label: "Background Queue")
    
    // Event called when any type of Request is resumed.
    func requestDidResume(_ request: Request) {
//        AppLogger.d("\n\n Outgoing -> \(request.request?.method?.rawValue ?? "N/A"): \(request.request?.url?.path ?? "NULL_URL"), \(request.request?.httpBody.toJSONString() ?? "NULL_BODY") \n\n")
    }
    
    // Event called whenever a DataRequest has parsed a response.
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
//        AppLogger.d("\n\n Incoming <- \(request.request?.method?.rawValue ?? "N/A"), \(request.request?.url?.path ?? "NULL_URL"), \(response.data.toJSONString()) \n\n")
    }
}
