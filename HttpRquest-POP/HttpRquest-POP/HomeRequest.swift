//
//  HomeRequest.swift
//  HttpRquest-POP
//
//  Created by 周正飞 on 2018/10/11.
//  Copyright © 2018年 MIX. All rights reserved.
//

import Foundation
class HomeRequest {
    
    /// An Example
    class LoadList: PostRequest {
        typealias ExpectedType = List
        var path: RequestConfig.Path = .home
        var action: RequestConfig.Action = .getList
        var parameter: [String : Any] = [:]
        
        var parse: (Dict) -> List? = { root in
            /// JSON Analysis
            return List(name: "a", age: 3)
        }
        
        init(page: Int, pageSize: Int) {
            parameter["page"] = page
            parameter["pageSize"] = pageSize
        }
    }
}
