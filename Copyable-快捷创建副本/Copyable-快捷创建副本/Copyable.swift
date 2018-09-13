//
//  Copyable.swift
//  SwiftTest
//
//  Created by 周正飞 on 2018/9/11.
//  Copyright © 2018年 周正飞. All rights reserved.
//

import Foundation

protocol Copyable: class, Codable {
    /// 返回某一类实例的副本
    func copy() -> Self
}

extension Copyable {

    func copy() -> Self {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(self) else {
            fatalError("encode失败")
        }
        let decoder = JSONDecoder()
        guard let target = try? decoder.decode(Self.self, from: data) else {
           fatalError("decode失败")
        }
        return target
    }
}
