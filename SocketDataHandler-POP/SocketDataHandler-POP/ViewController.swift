//
//  ViewController.swift
//  SocketDataHandler-POP
//
//  Created by 周正飞 on 2018/10/11.
//  Copyright © 2018年 MIX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let socketDispose = SocketDispose()

    override func viewDidLoad() {
        super.viewDidLoad()
        /// 模拟发送数据
        SocketClient().receiveDatas()
    
        HomeSocketMonitor.UserInfo(dispose: socketDispose).receiveData { (result) in
            print(result)
        }
    }


}

