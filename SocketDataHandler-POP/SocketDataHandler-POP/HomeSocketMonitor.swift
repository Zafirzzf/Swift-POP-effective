//
//  HomeSocketMonitor.swift
//  SocketDataHandler-POP
//
//  Created by 周正飞 on 2018/10/11.
//  Copyright © 2018年 MIX. All rights reserved.
//

import Foundation

typealias Dict = [String: AnyObject]

class HomeSocketMonitor {
    class UserInfo: SocketDataMonitor {
        typealias ResponseType = String
        var dataType: SocketDataType = .userInfo
        var parse: (AnyObject) -> String? = { body in
            guard let result = body as? Dict else { return nil }
            return result["name"] as! String
        }
    }
}
