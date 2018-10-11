//
//  SocketDataHandlers.swift
//  DailyRead
//
//  Created by 周正飞 on 2018/10/11.
//  Copyright © 2018年 MIX. All rights reserved.
//

import Foundation

/// 存储某一种Socket数据对应的Handlers.
class SocketDataHandlers {
    
    var type: SocketDataType
    var handlers: [SocketHandler]
    
    init(type: SocketDataType, handlers: [SocketHandler]) {
        self.type = type
        self.handlers = handlers
    }
}

class SocketHandler {
    /// 一个Handler处理对应一个dispose
    weak var dispose: SocketDispose?
    var handler: SimpleHandler
    
    init(dispose: SocketDispose,
         handler: @escaping SimpleHandler) {
        self.dispose = dispose
        self.handler = handler
    }
}

class SocketDispose: Equatable {
    
    deinit {
        /// 当一个观察者销毁时候把对应其所有的handler移除
        SocketClient.dataHandlers.forEach { dataHandler in
            dataHandler.handlers.removeAll(where: { $0.dispose == nil })
        }
    }
    
    static func == (lhs: SocketDispose, rhs: SocketDispose) -> Bool {
        return twoObjectAddressIsEqual(lhs, rhs)
    }
}
