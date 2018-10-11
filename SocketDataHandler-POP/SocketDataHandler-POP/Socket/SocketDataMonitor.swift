//
//  SocketDataType.swift
//  DailyRead
//
//  Created by 周正飞 on 2018/10/10.
//  Copyright © 2018年 MIX. All rights reserved.
//

import Foundation

protocol SocketDataMonitor: class {
    associatedtype ResponseType
    var dataType: SocketDataType { get }
    var dispose: SocketDispose { get }
    var parse: (AnyObject) -> ResponseType? { get }
}

// MARK: - 监听Socket数据
extension SocketDataMonitor {
    func receiveData(response: @escaping (ResponseType) -> ()) {
        SocketClient.addDataMonitor(type: dataType, dispose: dispose) { (rootDict) in
            if let result = self.parse(rootDict) {
                response(result)
            }
        }
    }
}

