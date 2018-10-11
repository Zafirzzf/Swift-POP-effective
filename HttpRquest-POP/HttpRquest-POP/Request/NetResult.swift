//
//  NetResult.swift
//  HttpRquest-POP
//
//  Created by 周正飞 on 2018/10/11.
//  Copyright © 2018年 MIX. All rights reserved.
//

import Foundation

enum NetResult<V> {
    case value(V)
    case error(RequestError)
    init(value: V?, error: RequestError?) {
        self = error == nil ? NetResult.value(value!) : .error(error!)
    }
    
    var value: V? {
        switch self {
        case .value(let value):
            return value
        case .error:
            return nil
        }
    }
    
    var error: RequestError? {
        switch self {
        case .value:
            return nil
        case .error(let error):
            return error
        }
    }
}

enum RequestError: Error {
    case serviceLost
    case rootDataNotDict
    case timeout
    case jsonToModelFailure
    case other
}

