//
//  HTTPRequest.swift
//  HttpRquest-POP
//
//  Created by 周正飞 on 2018/10/11.
//  Copyright © 2018年 MIX. All rights reserved.
//

import Foundation

enum RequestMethod {
    case get
    case post
}

protocol Request {
    
    // The type we expect to end up
    associatedtype ExpectedType
    var path: RequestConfig.Path { get }
    var action: RequestConfig.Action { get }
    var method: RequestMethod { get }
    var parameter: [String: Any] { get set }
    var headers: [String: String] { get }
    // How to convert from response to expected type
    var parse: ([String: Any]) -> ExpectedType? { get }
}
