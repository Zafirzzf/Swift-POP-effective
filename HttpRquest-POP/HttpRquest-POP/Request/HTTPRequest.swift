//
//  HTTPRequest.swift
//  HttpRquest-POP
//
//  Created by 周正飞 on 2018/10/11.
//  Copyright © 2018年 MIX. All rights reserved.
//

import Foundation
import Alamofire

typealias Dict = [String: Any]

protocol Request {
    
    // The type we expect to end up
    associatedtype ExpectedType
    var path: RequestConfig.Path { get }
    var action: RequestConfig.Action { get }
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get set }
    var headers: HTTPHeaders { get }
    var encoding: ParameterEncoding { get }
    
    // How to convert from response to expected type
    var parse: (Dict) -> ExpectedType? { get }
}

// MARK: - GET Request Configuration
protocol GetRequest: Request {}

extension GetRequest {
    var method: HTTPMethod {
        return .get
    }
    var headers: HTTPHeaders {
        return [:]
    }
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
}

// MARK: - POST Request Configuration
protocol PostRequest: Request {}

extension PostRequest {
    var method: HTTPMethod {
        return .post
    }
    var headers: HTTPHeaders {
        return [:]
    }
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}

/// Some common convert of parameter
extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {
    mutating func toCommonAction(action: String){
        var tempDict: [String: Any] = ["a": action]
        tempDict["d"] = self as! [String: Any]
        self.removeAll()
        self = tempDict as! Dictionary<Key, Value>
    }
}



