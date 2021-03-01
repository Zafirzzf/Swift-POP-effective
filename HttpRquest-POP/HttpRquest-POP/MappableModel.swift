//
//  MappableModel.swift
//  HttpRquest-POP
//
//  Created by 周正飞 on 2021/3/1.
//  Copyright © 2021 MIX. All rights reserved.
//

import Foundation

protocol MappableModel {
    static var dataParse: ([String: Any]) -> Self? { get }
}

extension MappableModel {
    static var dataParse: ([String: Any]) -> Self? {
        return { dict in
            // ObjectMapper or codable or handyJson
            return nil
        }
    }
    
    /// Can add other custom parse
}
