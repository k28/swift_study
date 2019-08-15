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
        privateQueueSample()
    }
    
    /**
     Mainディスパッチキューの使用サンプル
     */
    func mainDispatchQueueSample() {
        // キューの取得
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
    
    /**
     grobalキュー仕様のサンプル
     処理を別スレッドで行いたい時には、こちらを使っておけば良い
     */
    func grobalQueueSample() {
        // キューの取得
        let globalQueue = DispatchQueue.global(qos: .default)
        
        var greet = ""
        
        // 同期的に処理
        globalQueue.sync {
            greet = "Hello!"
            print("\(greet) Grobal Sync Queue")
        }
        
        // syncは同期的に処理されるので、スレッド処理の下で値にアクセスする事ができる
        print("\(greet) grobalQueueSample")
        
        // 非同期に処理
        globalQueue.async {
            print("\(greet) Grobal Async Queue")
        }
    }
    
    // 非同期的なプライベートキューを作成
    // 非同期なので、タスクは並列に処理される
    let concurrentPrivateQueue_: DispatchQueue = DispatchQueue(label: "ConcurrentQueue", qos: .userInteractive, attributes:.concurrent)
    
    // 逐次処理するくキュー
    // 処理が終わってから次の処理を行う
    let oneByOnePrivateQueue_: DispatchQueue = DispatchQueue(label: "OneByOne", qos: .userInteractive, attributes:.initiallyInactive)
    
    func useQueue(label: String, queue: DispatchQueue) {
        queue.async {
            for i in 1...10 {
                print("\(label) First \(i)")
            }
        }
        queue.async {
            for i in 1...10 {
                print("\(label) Second \(i)")
            }
        }
        queue.async {
            for i in 1...10 {
                print("\(label) Third \(i)")
            }
        }
    }
    
    func privateQueueSample() {
        // 逐次処理は開始しないと処理が実行されない
        oneByOnePrivateQueue_.activate()
        useQueue(label: "OneByOne", queue: oneByOnePrivateQueue_)
        
        useQueue(label: "Concurrent", queue: concurrentPrivateQueue_)
    }

}

