//
//  ViewController.swift
//  Weather Forecast
//
//  Created by Jerry on 7/28/15.
//  Copyright (c) 2015 Jerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Search: UITextField!
    @IBOutlet weak var Output: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func  request(httpUrl: String, httpArg: String) {
        var req = NSMutableURLRequest(URL: NSURL(string: httpUrl + "?" + httpArg)!)
        req.timeoutInterval = 6
        req.HTTPMethod = "GET"
        req.addValue("a32fec4fbcfb43e906d682e0c1fdf5aa", forHTTPHeaderField: "apikey")
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) -> Void in
            let res = response as! NSHTTPURLResponse
            println(res.statusCode)
            if let e = error{
                println("请求失败")
            }
            if let d = data {
                var content = NSString(data: d, encoding: NSUTF8StringEncoding)
                println(content)
                var dictionary = NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSDictionary
                var retdata = dictionary["retData"] as! NSDictionary
                var weather = retdata["weather"] as! String
                var city = retdata["city"] as! String
                var temperature = retdata["temp"] as! String
                var date = retdata["date"] as! String
                self.Output.text = "\(city) \(date) \(weather) \(temperature)℃"
            }
        }


    }
    @IBAction func Weatherclick(sender: UIButton) {
        if Search.text != "" {
            var url = "http://apis.baidu.com/apistore/weatherservice/weather"
            var httpArg = "citypinyin=\(Search.text)"
            request(url, httpArg: httpArg)
            
        }else {
            Output.text = "City name is empty"
        }
        
    }
    

}