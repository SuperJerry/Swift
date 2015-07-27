//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jerry on 7/22/15.
//  Copyright (c) 2015 Jerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var click = 0
    var result = [0,0,0,0,0,0,0,0,0]

    @IBOutlet weak var again: UILabel!
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttom1(sender: UIButton) {
        
        if result[0] != 0 {
        }else {
            click++
            if click % 2 == 0{
                sender.setTitle("o", forState: UIControlState.Normal)
                result[0] = 1
            }else if click % 2 != 0{
                sender.setTitle("x", forState: UIControlState.Normal)
                result[0] = 2
            }
            if click > 4{
                var result = checkboard()
                again.text = result
            }

        }
    }

    @IBAction func buttom2(sender: UIButton) {
        if result[1] != 0{
        }else{
            click++
            if click % 2 == 0{
                sender.setTitle("o", forState: UIControlState.Normal)
                result[1] = 1
            }else if click % 2 != 0{
                sender.setTitle("x", forState: UIControlState.Normal)
                result[1] = 2
            }
            if click > 4{
                var result = checkboard()
                again.text = result
            }
        }
    }
   
    @IBAction func buttom3(sender: UIButton) {
        if result[2] != 0{
        }else{
            click++
            if click % 2 == 0{
                sender.setTitle("o", forState: UIControlState.Normal)
                result[2] = 1
            }else if click % 2 != 0{
                sender.setTitle("x", forState: UIControlState.Normal)
                result[2] = 2
            }
            if click > 4{
                var result = checkboard()
                again.text = result
            }
        }
    }
    @IBAction func buttom4(sender: UIButton) {
        if result[3] != 0{
        }else{
            click++
            if click % 2 == 0{
                sender.setTitle("o", forState:UIControlState.Normal)
                result[3] = 1
            }else if click % 2 != 0{
                sender.setTitle("x", forState:UIControlState.Normal)
                result[3] = 2
            }
            if click > 4{
                var result = checkboard()
                again.text = result
            }
        }
    }
    @IBAction func buttom5(sender: UIButton) {
        if result[4] != 0{
        }else{
            click++
            if click % 2 == 0{
                sender.setTitle("o", forState: UIControlState.Normal)
                result[4] = 1
            }else if click % 2 != 0{
                sender.setTitle("x", forState: UIControlState.Normal)
                result[4] = 2
            }
            if click > 4{
                var result = checkboard()
                again.text = result
            }
        }
    }
    @IBAction func buttom6(sender: UIButton) {
        if result[5] != 0{
        }else{
            click++
            if click % 2 == 0{
                sender.setTitle("o", forState: UIControlState.Normal)
                result[5] = 1
            }else if click % 2 != 0{
                sender.setTitle("x", forState: UIControlState.Normal)
                result[5] = 2
            }
            if click > 4{
                var result = checkboard()
                again.text = result
            }
        }
    }
    
    @IBAction func buttom7(sender: UIButton) {
        if result[6] != 0{
        }else{
            click++
            if click % 2 == 0{
                sender.setTitle("o", forState: UIControlState.Normal)
                result[6] = 1
            }else if click % 2 != 0{
                sender.setTitle("x", forState: UIControlState.Normal)
                result[6] = 2
            }
            if click > 4{
                var result = checkboard()
                again.text = result
            }
        }
    }
    
    @IBAction func buttom8(sender: UIButton) {
        if result[7] != 0{
        }else{
            click++
            if click % 2 == 0{
                sender.setTitle("o", forState: UIControlState.Normal)
                result[7] = 1
            }else if click % 2 != 0{
                sender.setTitle("x", forState: UIControlState.Normal)
                result[7] = 2
            }
            if click > 4{
                var result = checkboard()
                again.text = result
            }
        }
    }
    @IBAction func buttom9(sender: UIButton) {
        if result[8] != 0{
        }else{
            click++
            if click % 2 == 0{
                sender.setTitle("o", forState: UIControlState.Normal)
                result[8] = 1
            }else if click % 2 != 0{
                sender.setTitle("x", forState: UIControlState.Normal)
                result[8] = 2
            }
            if click > 4{
                var result = checkboard()
                again.text = result
            }
        }
    }
    func clear(){
        button1.setTitle("", forState:UIControlState.Normal)
        button2.setTitle("", forState:UIControlState.Normal)
        button3.setTitle("", forState:UIControlState.Normal)
        button4.setTitle("", forState:UIControlState.Normal)
        button5.setTitle("", forState:UIControlState.Normal)
        button6.setTitle("", forState:UIControlState.Normal)
        button7.setTitle("", forState:UIControlState.Normal)
        button8.setTitle("", forState:UIControlState.Normal)
        button9.setTitle("", forState:UIControlState.Normal)
        click = 0
        result = [0,0,0,0,0,0,0,0,0]
    }
    func checkboard() -> String {
        if result[0] == result[1] && result[1] == result[2] && result[0] != 0{
            if click % 2 == 0{
                clear()
                return "Player 2 wins"
            }else{
                clear()
                return "Player 1 wins"
            }
        }else if result[3] == result[4] && result[4] == result[5] && result[3] != 0{
            if click % 2 == 0{
                clear()
                return "Player 2 wins"
            }else{
                clear()
                return "Player 1 wins"
            }
        }else if result[6] == result[7] && result[7] == result[8] && result[6] != 0{
            if click % 2 == 0{
                clear()
                return "Player 2 wins"
            }else{
                clear()
                return "Player 1 wins"
            }
        }else if result[0] == result[3] && result[3] == result[6] && result[6] != 0{
            if click % 2 == 0{
                clear()
                return "Player 2 wins"
            }else{
                clear()
                return "Player 1 wins"
            }
        }else if result[1] == result[4] && result[4] == result[7] && result[4] != 0{
            if click % 2 == 0{
                clear()
                return "Player 2 wins"
            }else{
                clear()
                return "Player 1 wins"
            }
        }else if result[2] == result[5] && result[5] == result[8] && result[5] != 0{
            if click % 2 == 0{
                clear()
                return "Player 2 wins"
            }else{
                clear()
                return "Player 1 wins"
            }
        }else if result[0] == result[4] && result[4] == result[8] && result[4] != 0{
            if click % 2 == 0{
                clear()
                return "Player 2 wins"
            }else{
                clear()
                return "Player 1 wins"
            }
        }else if result[2] == result[4] && result[4] == result[6] && result[2] != 0{
            if click % 2 == 0{
                clear()
                return "Player 2 wins"
            }else{
                clear()
                return "Player 1 wins"
            }
        }else{
            if click > 8{
                clear()
                return "tie"
            }else {
                return ""
            }
        }
    }
}










