//
//  ViewController.swift
//  prime
//
//  Created by 王培英 on 15/7/20.
//  Copyright (c) 2015年 王培英. All rights reserved.
//

import UIKit
//import Cocoa

class ViewController: UIViewController {

    @IBOutlet weak var Number: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Action(sender: AnyObject) {
        var button = sender as! UIButton
        button.backgroundColor = UIColor.redColor()
        var num = Number.text.toInt()
        if num == 2{
            Prime.text = "Is Prime Number"
        }else if num == 3{
            Prime.text = "Is Prime Number"
        }
        
        var i = 0
        
        func sqrt(value: Int) -> Int{
            for(i = 2; i*i <= value; i++){
                if (i*i + 2*i + 1) > value {
                    return i
                }
            }
            return 1
        }
        
        println(sqrt(num!))
        for(var i=2;i <= sqrt(num!); i++){
            if num! % i == 0{
                Prime.text = "Not Prime Number!"
                break
            }
            else{
                Prime.text = "Is Prime Number"
            }
            
        }
    }

    @IBOutlet weak var Prime: UILabel!
}

