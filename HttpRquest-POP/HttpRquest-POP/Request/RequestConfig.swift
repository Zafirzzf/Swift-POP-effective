//
//  RequestConfig.swift
//  HttpRquest-POP
//
//  Created by 周正飞 on 2018/10/11.
//  Copyright © 2018年 MIX. All rights reserved.
//

import Foundation

struct RequestConfig {
    
    static let host = "http://192.1.1.1.1:"
    
    enum Path: String {
        case home = "/home"
        case userInfo = "/userinfo"
    }
    
    enum Action: String {
        case getList = "getList"
    }
}
