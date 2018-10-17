//
//  SecondViewController.swift
//  SocketDataHandler-POP
//
//  Created by 周正飞 on 2018/10/17.
//  Copyright © 2018年 MIX. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    deinit {
        print("销毁")
    }
    
    let dispose = SocketDispose()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        HomeSocketMonitor.UserInfo().receiveData(dispose: dispose) { (result) in
            print(result, "2")
        }
    }
}
