//
//  ViewController.swift
//  GuesstheNumber
//
//  Created by Jerry on 7/22/15.
//  Copyright (c) 2015 Jerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Number: UITextField!

    var Ramdom = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Ramdom = Int(arc4random()  % 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Click(sender: UIButton) {
        
        if Number.text.toInt() == Ramdom{
            Result.text = "Congratulations! Again?"
            Ramdom = Int(arc4random()  % 100)
        }else if Number.text.toInt() <= Ramdom{
            Result.text = "Too Small! Try Again?"
        }else if Number.text.toInt() >= Ramdom{
            Result.text = "Too Big! Try Again?"
        }
    }

    @IBOutlet weak var Result: UILabel!
}

