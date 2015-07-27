//
//  ViewController.swift
//  first app
//
//  Created by 王培英 on 15/7/20.
//  Copyright (c) 2015年 王培英. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Entername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonclick(sender: AnyObject) {
        var name = Entername.text
        Hello.text = "Hello, " + name
    }
    @IBOutlet weak var Hello: UILabel!

}

