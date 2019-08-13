//
//  ViewController.swift
//  http_access_sample
//
//  Created by K.Hatano on 2019/08/13.
//  Copyright © 2019 K.Hatano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueLabel_: UILabel!
    
    // アクセス情報の入っているJSONファイル
    /*
     {
     "api_key":"xxxxxxxxxxxx",
     "user_id" : "yyyyyyyy",
     "user_pass" : "zzzzzzzz"
     }
     */
    let acces_param_file_name_ = "webstorage" // .json
    
    let web_storage_uri_ = "https://api.webstorage.jp/v1/devices/current"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        accessWebStorage()
    }
    
    func dictionaryToJsonData(dict: [String: Any]) -> Data? {
        var json: String = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [])
            json = String(data: jsonData, encoding: .utf8) ?? ""
        } catch {
            return Data()
        }
        
        // NSLog("request json string %@", json)
        let strData = json.data(using: .utf8)
        return strData
    }
    
    /**
        おんどとりWebStorageのWebAPIにアクセスしてみる
    */
    func accessWebStorage() {
        // アクセスパラメーターを読み込み
        let webStorageDataPath = Bundle.main.path(forResource: self.acces_param_file_name_, ofType: "json")
        
        guard let content = try? Data(contentsOf: URL(fileURLWithPath: webStorageDataPath!)) else {
            return
        }
        
        let webStorageInfo = try? JSONSerialization.jsonObject(with: content, options: [])
        
        guard let _webStorageInfo = webStorageInfo as? [String:Any] else {
            return
        }
        
        // NSLog("%@",_webStorageInfo)
        let apiKey   = _webStorageInfo["api_key"]    as? String ?? ""
        let userId   = _webStorageInfo["user_id"]    as? String ?? ""
        let userPass = _webStorageInfo["user_pass"]  as? String ?? ""
        
        // リクエストパラメーターの組み立て
        // 今回は全てのコンテンツのパラメーターを取得する
        let requestParameter = [
            "api-key"    : apiKey,
            "login-id"   : userId,
            "login-pass" : userPass,
        ]

        NSLog("request parameter %@",requestParameter)

        let url = URL(string: web_storage_uri_)
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.httpBody = dictionaryToJsonData(dict: requestParameter)!
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("GET", forHTTPHeaderField: "X-HTTP-Method-Override")
        request.addValue("api.webstorage.jp:443", forHTTPHeaderField: "Host")

        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                NSLog("%@", response)
                
                let responseData: [String:Any] = try! JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] ?? [:]
                NSLog("response data %@", responseData)
            }
        }.resume()
        
        return
    }
}

