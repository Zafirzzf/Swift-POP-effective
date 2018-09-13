//
//  ViewController.swift
//  Copyable-快捷创建副本
//
//  Created by 周正飞 on 2018/9/13.
//  Copyright © 2018年 MIX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let person = Person()
        person.name = "a"
        person.man.height = 1
        
        let person2 = person.copy()
        print("新副本", person2.name, person2.man.height)
        
        person2.name = "b"
        person2.man.height = 2
        print("修改副本后",
              person.name,
              person.man.height,
              person2.name,
              person2.man.height)
    }
}

