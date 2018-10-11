//
//  HTTPRequest+Load.swift
//  HttpRquest-POP
//
//  Created by 周正飞 on 2018/10/11.
//  Copyright © 2018年 MIX. All rights reserved.
//

import Foundation
import Alamofire

extension Request {
    /// Common load function
    func load(handler: @escaping (NetResult<ExpectedType>) -> Void) {
        
        let path = RequestConfig.host + self.path.rawValue
        parameter.toCommonAction(action: self.action.rawValue)
        
        let manager = Alamofire.SessionManager(
            configuration: {
                let config = URLSessionConfiguration.default
                config.timeoutIntervalForRequest = 15
                return config
        }())
        
        manager.request(path, method: method, parameters: parameter, encoding: encoding, headers: headers).responseJSON { (response) in
            let result = response.result
            if let _ = result.error {
                handler(NetResult(value: nil, error: .serviceLost))
                return
            }
            guard let resultDict = result.value as? Dict else {
                handler(NetResult(value: nil, error: .rootDataNotDict))
                return
            }
            guard let targetData = self.parse(resultDict) else {
                handler(NetResult(value: nil, error: .jsonToModelFailure))
                return
            }
            /// You can add more error handling based on response
            handler(NetResult(value: targetData, error: nil))
        }
    }
}
