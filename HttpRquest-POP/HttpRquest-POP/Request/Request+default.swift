//
//  Request+default.swift
//  HttpRquest-POP
//
//  Created by 周正飞 on 2021/3/1.
//  Copyright © 2021 MIX. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - GET Request Configuration
protocol GetRequest: Request {}

extension GetRequest {
    var method: RequestMethod {
        return .get
    }
    var headers: [String: String] {
        return [:]
    }
}

// MARK: - POST Request Configuration
protocol PostRequest: Request {}

extension PostRequest {
    var method: RequestMethod {
        return .post
    }
    var headers: [String: String] {
        return [:]
    }
}
