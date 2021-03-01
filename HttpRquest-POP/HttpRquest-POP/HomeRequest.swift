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
    
    struct SimpleData: GetRequest {
        var path: RequestConfig.Path = .userInfo
        var action: RequestConfig.Action = .getList
        var parameter: [String : Any] = [:]
        var parse: ([String : Any]) -> Bool? = {
            $0["data"] as? Bool ?? false
        }
    }
    
    struct LoadList: PostRequest {
        var path: RequestConfig.Path = .home
        var action: RequestConfig.Action = .getList
        var parameter: [String : Any] = [:]
        
        var parse: ([String: Any]) -> List? = List.dataParse
        
        init(page: Int, pageSize: Int) {
            parameter["page"] = page
            parameter["pageSize"] = pageSize
        }
    }
}
