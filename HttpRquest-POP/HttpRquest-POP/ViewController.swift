//
//  ViewController.swift
//  HttpRquest-POP
//
//  Created by 周正飞 on 2018/10/11.
//  Copyright © 2018年 MIX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let request = HomeRequest.self
    override func viewDidLoad() {
        super.viewDidLoad()
        loadListData()
        
    }
    
    func loadListData() {
        
        request.LoadList(page: 1, pageSize: 1).load { (result) in
            if let error = result.error {
                
                return
            }
            let list = result.value
        }
    }
}

