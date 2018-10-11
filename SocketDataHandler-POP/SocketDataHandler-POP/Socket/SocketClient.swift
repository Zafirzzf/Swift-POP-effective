//
//  SocketDataManager.swift
//  DailyRead
//
//  Created by 周正飞 on 2018/10/10.
//  Copyright © 2018年 MIX. All rights reserved.
//

import Foundation

enum SocketDataType: Int {
    case homePage = 100
    case userInfo = 20
    case unknow
    
    init(op: Int) {
        self = SocketDataType(rawValue: op) ?? SocketDataType.unknow
    }
}

typealias SimpleHandler = (AnyObject) -> ()

/// 负责中转socket数据
final class SocketClient {
    
    /// 当前所有对socket回调处理集合
    static var dataHandlers = [SocketDataHandlers]()
    
    var timer: Timer!
    
    func receiveDatas() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(pushData), userInfo: nil, repeats: true)
    }
    
    /// 模拟不断接收数据
    @objc func pushData() {
        let op = 100
        let seq = 3
        let homePageData = String(Int.random(in: 1...5))
        let resultDict = ["seq": seq, "name": homePageData] as AnyObject
        
        if let dataHandler = SocketClient.findTypeHandler(type: SocketDataType(op: op)) {
            dataHandler.handlers.forEach { $0.handler(resultDict) }
        }
        if let userInfoDataHandler = SocketClient.findTypeHandler(type: SocketDataType(op: 20)) {
            userInfoDataHandler.handlers.forEach { $0.handler(resultDict) }
        }
    }
}

// MARK: - 对外提供
extension SocketClient {
    
    /// 新增数据订阅
    static func addDataMonitor(type: SocketDataType,
                               dispose: SocketDispose,
                               handler: @escaping SimpleHandler) {
        
        if let typeHandler = dataHandlers.first(where: { $0.type == type }) {
            if let existTargetHandler = typeHandler.handlers.first(where: { $0.dispose == dispose }) {
                // 如果dispose相同表示已经注册过, 覆盖原先的
                existTargetHandler.handler = handler
            } else {
                typeHandler.handlers.append(
                    SocketHandler(dispose: dispose, handler: handler)
                )
            }
        }
        
        /// 没有就添加
        let newHandler = SocketDataHandlers(type: type, handlers: [SocketHandler(dispose: dispose, handler: handler)])
        dataHandlers.append(newHandler)
    }
}

// MARK: - 私有方法
extension SocketClient {
    
    private static func findTypeHandler(type: SocketDataType) -> SocketDataHandlers? {
        guard let handler = dataHandlers.first(where: {$0.type == type}) else { return nil }
        return handler
    }
}

func twoObjectAddressIsEqual(_ left: AnyObject?, _ right: AnyObject?) -> Bool {
    guard let left = left, let right = right else { return false }
    return Unmanaged.passUnretained(left).toOpaque() == Unmanaged.passUnretained(right).toOpaque()
}

