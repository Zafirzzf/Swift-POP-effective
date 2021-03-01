//
//  HTTPRequest+Load.swift
//  HttpRquest-POP
//
//  Created by 周正飞 on 2018/10/11.
//  Copyright © 2018年 MIX. All rights reserved.
//

import Foundation
import Alamofire

/// 扩展发起请求与回调的方式- 闭包/Observable/Promise
extension Request {
    /// Common load function
    func load(handler: @escaping (NetResult<ExpectedType>) -> Void) {
        let path = RequestConfig.host + self.path.rawValue
        Alamofire.request(path, method: method == .get ? .get : .post, parameters: parameter, headers: headers).responseJSON {  (response) in
            let result = response.result
            if let _ = result.error {
                handler(NetResult(value: nil, error: .serviceLost))
                return
            }
            guard let resultDict = result.value as? [String: Any] else {
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
    
    /// 返回Observable序列
//    func fetch() -> Observable<ExpectedType> {
//        return Single<ExpectedType>.create { single in
//            RequestManager.manager.request(self.pathStr, method: self.method, parameters: self.parameter, encoding: self.encoding, headers: self.headers).responseJSON(completionHandler: { (response) in
//                let myResult = self.handleResponse(result: response.result)
//                if let error = myResult.error {
//                    single(.error(error))
//                } else {
//                    single(.success(myResult.value!))
//                }
//            })
//            return Disposables.create()
//        }.asObservable()
//    }
}
