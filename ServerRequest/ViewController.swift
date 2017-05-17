//
//  ViewController.swift
//  ServerRequest
//
//  Created by 楷岷 張 on 2017/5/15.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func gitButton(_ sender: UIButton) {
        downloadWithSession(wedAddress: "https://httpbin.org/get")
    }
    

    @IBAction func postButton(_ sender: UIButton) {
       postApi()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var session:URLSession? = {
        return URLSession(configuration: .default)
    }()
    
    func downloadWithSession(wedAddress:String) {
        if let url = URL(string: wedAddress) {
            let task = session?.dataTask(with: url, completionHandler: { (data, Response, error) in
                if error != nil {
                    return
                } else {
                    if let downloadData = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: downloadData, options: [])
                            self.parseJson(json: json)
                        } catch {
                            
                        }
                        
                    }
                }
            })
            task?.resume()
        }
    }
    
    func parseJson(json: Any) {
        if let jsonAgain = json as? [String:Any] {
//                let originArray = jsonAgain[0]
            if let origin = jsonAgain["origin"] as? String {
                NSLog("%@", origin)
            }
        }
    }
    
    func postApi() {
        if let url = URL(string: "https://httpbin.org/post") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            let postDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = dateFormatter.string(from: postDate)
            
            do {
               let postData = try JSONSerialization.data(withJSONObject: ["time":dateString], options: .prettyPrinted)
                request.httpBody = postData
                request.addValue("applocation/json", forHTTPHeaderField: "Content-Type")
            } catch {
                print(error.localizedDescription)
            }
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                let time = Calendar(identifier: .gregorian).dateComponents([.nanosecond], from: postDate, to: Date())
                NSLog("%@", "花了\(time.nanosecond! / 1000000)毫秒")
            })
            
            task.resume()
        }
    }

}

