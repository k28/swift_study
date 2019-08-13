//
//  ViewController.swift
//  thread_sample
//
//  Created by K.Hatano on 2019/08/14.
//  Copyright © 2019 K.Hatano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainDispatchQueueSample()
        grobalQueueSample()
    }
    
    /**
     Mainディスパッチキューの使用サンプル
     */
    func mainDispatchQueueSample() {
        let mainQueue = DispatchQueue.main
        
        // EXC_BAD_INSTRUCTION になる
        // おそらく、MainスレッドからsyncでCallしたため、デッドロック
        // mainQueue.sync {
        //     print("Hello! sync MainQueue")
        // }
        
        // 非同期で実行(おそらくこの処理が終わってからCallされる
        mainQueue.async {
            print("Hello! async MainQueue")
        }
    }
    
    func grobalQueueSample() {
        let globalQueue = DispatchQueue.global(qos: .default)
        
        var greet = ""
        
        // 同期的に処理
        globalQueue.sync {
            greet = "Hello!"
            print("\(greet) Grobal Sync Queue")
        }
        
        // syncは同期的に処理されるので、スレッド処理の下で値にアクセスする事ができる
        print("\(greet) grobalQueueSample")

        globalQueue.async {
            print("\(greet) Grobal Async Queue")
        }
    }

}

