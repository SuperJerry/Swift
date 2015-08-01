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
    var Mode = 0
    var xc = 0
    var oc = 0
    
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
    
    @IBOutlet weak var xwin: UILabel!
    
    @IBOutlet weak var owin: UILabel!
    
    @IBAction func playerMode(sender: UIButton) {
        Mode = 0
        clear()
        xc = 0
        oc = 0
        xwin.text = " X Wins: \(xc)"
        owin.text = " O Wins: \(oc)"
        again.text = ""
    }
    
    @IBAction func AIMode(sender: UIButton) {
        Mode = 1
        clear()
        xc = 0
        oc = 0
        xwin.text = " X Wins: \(xc)"
        owin.text = " O Wins: \(oc)"
        again.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.backgroundColor = UIColor.skyBlueColor()
        //self.view.backgroundColor = UIColor.skyBlueColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttom1(sender: UIButton) {
        if Mode == 0 {
            if result[0] != 0 {
            }else {
                click++
                if click % 2 == 0{
                sender.setTitle("o", forState: UIControlState.Normal)
                result[0] = 2
                }else if click % 2 != 0{
                sender.setTitle("x", forState: UIControlState.Normal)
                result[0] = 1
                }
                if click > 4{
                    var result = checkboard1()
                    again.text = result
                }
            }
        }else if Mode == 1{
            if result[0] != 0 {
            }else {
                click++
                sender.setTitle("x", forState: UIControlState.Normal)
                result[0] = 1
                AIsolve()
                if click > 2{
                    var result = checkboard()
                    again.text = result
                }
            }
        }
        
    }
    @IBAction func buttom2(sender: UIButton) {
        if Mode == 0 {
            if result[1] != 0 {
            }else {
                click++
                if click % 2 == 0{
                    sender.setTitle("o", forState: UIControlState.Normal)
                    result[1] = 2
                }else if click % 2 != 0{
                    sender.setTitle("x", forState: UIControlState.Normal)
                    result[1] = 1
                }
                if click > 4{
                    var result = checkboard1()
                    again.text = result
                }
            }
        }else if Mode == 1{
            if result[1] != 0{
            }else{
                click++
                sender.setTitle("x", forState: UIControlState.Normal)
                result[1] = 1
                AIsolve()
                if click > 2{
                    var result = checkboard()
                    again.text = result
                }
            }
        }
    }
   
    @IBAction func buttom3(sender: UIButton) {
        if Mode == 0 {
            if result[2] != 0 {
            }else {
                click++
                if click % 2 == 0{
                    sender.setTitle("o", forState: UIControlState.Normal)
                    result[2] = 2
                }else if click % 2 != 0{
                    sender.setTitle("x", forState: UIControlState.Normal)
                    result[2] = 1
                }
                if click > 4{
                    var result = checkboard1()
                    again.text = result
                }
            }
        }else if Mode == 1{
            if result[2] != 0{
            }else{
                click++
                sender.setTitle("x", forState: UIControlState.Normal)
                result[2] = 1
                AIsolve()
                if click > 2{
                    var result = checkboard()
                    again.text = result
                }
            }
        }
    }
    @IBAction func buttom4(sender: UIButton) {
        if Mode == 0 {
            if result[3] != 0 {
            }else {
                click++
                if click % 2 == 0{
                    sender.setTitle("o", forState: UIControlState.Normal)
                    result[3] = 2
                }else if click % 2 != 0{
                    sender.setTitle("x", forState: UIControlState.Normal)
                    result[3] = 1
                }
                if click > 4{
                    var result = checkboard1()
                    again.text = result
                }
            }
        }else if Mode == 1{
            if result[3] != 0{
            }else{
                click++
                sender.setTitle("x", forState: UIControlState.Normal)
                result[3] = 1
                AIsolve()
                if click > 2{
                    var result = checkboard()
                    again.text = result
                }
            }
        }
    }
    @IBAction func buttom5(sender: UIButton) {
        if Mode == 0 {
            if result[4] != 0 {
            }else {
                click++
                if click % 2 == 0{
                    sender.setTitle("o", forState: UIControlState.Normal)
                    result[4] = 2
                }else if click % 2 != 0{
                    sender.setTitle("x", forState: UIControlState.Normal)
                    result[4] = 1
                }
                if click > 4{
                    var result = checkboard1()
                    again.text = result
                }
            }
        }else if Mode == 1{
            if result[4] != 0{
            }else{
                click++
                sender.setTitle("x", forState: UIControlState.Normal)
                result[4] = 1
                AIsolve()
                if click > 2{
                    var result = checkboard()
                    again.text = result
                }
            }
        }
    }
    @IBAction func buttom6(sender: UIButton) {
        if Mode == 0 {
            if result[5] != 0 {
            }else {
                click++
                if click % 2 == 0{
                    sender.setTitle("o", forState: UIControlState.Normal)
                    result[5] = 2
                }else if click % 2 != 0{
                    sender.setTitle("x", forState: UIControlState.Normal)
                    result[5] = 1
                }
                if click > 4{
                    var result = checkboard1()
                    again.text = result
                }
            }
        }else if Mode == 1{
            if result[5] != 0{
            }else{
                click++
                sender.setTitle("x", forState: UIControlState.Normal)
                result[5] = 1
                AIsolve()
                if click > 2{
                    var result = checkboard()
                    again.text = result
                }
            }
        }
    }
    
    @IBAction func buttom7(sender: UIButton) {
        if Mode == 0 {
            if result[6] != 0 {
            }else {
                click++
                if click % 2 == 0{
                    sender.setTitle("o", forState: UIControlState.Normal)
                    result[6] = 2
                }else if click % 2 != 0{
                    sender.setTitle("x", forState: UIControlState.Normal)
                    result[6] = 1
                }
                if click > 4{
                    var result = checkboard1()
                    again.text = result
                }
            }
        }else if Mode == 1{
            if result[6] != 0{
            }else{
                click++
                sender.setTitle("x", forState: UIControlState.Normal)
                result[6] = 1
                AIsolve()
                if click > 2{
                    var result = checkboard()
                    again.text = result
                }
            }
        }
    }
    
    @IBAction func buttom8(sender: UIButton) {
        if Mode == 0 {
            if result[7] != 0 {
            }else {
                click++
                if click % 2 == 0{
                    sender.setTitle("o", forState: UIControlState.Normal)
                    result[7] = 2
                }else if click % 2 != 0{
                    sender.setTitle("x", forState: UIControlState.Normal)
                    result[7] = 1
                }
                if click > 4{
                    var result = checkboard1()
                    again.text = result
                }
            }
        }else if Mode == 1{
            if result[7] != 0{
            }else{
                click++
                sender.setTitle("x", forState: UIControlState.Normal)
                result[7] = 1
                AIsolve()
                if click > 2{
                    var result = checkboard()
                    again.text = result
                }
            }
        }
    }
    @IBAction func buttom9(sender: UIButton) {
        if Mode == 0 {
            if result[8] != 0 {
            }else {
                click++
                if click % 2 == 0{
                    sender.setTitle("o", forState: UIControlState.Normal)
                    result[8] = 2
                }else if click % 2 != 0{
                    sender.setTitle("x", forState: UIControlState.Normal)
                    result[8] = 1
                }
                if click > 4{
                    var result = checkboard1()
                    again.text = result
                }
            }
        }else if Mode == 1{
            if result[8] != 0{
            }else{
                click++
                sender.setTitle("x", forState: UIControlState.Normal)
                result[8] = 1
                AIsolve()
                if click > 2{
                    var result = checkboard()
                    again.text = result
                }
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
    
    func checkboard1() -> String {
        if result[0] == result[1] && result[1] == result[2] && result[0] != 0{
            if click % 2 == 1{
                clear()
                xc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 1 wins"
            }else{
                clear()
                oc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 2 wins"
            }
        }else if result[3] == result[4] && result[4] == result[5] && result[3] != 0{
            if click % 2 == 1{
                clear()
                xc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 1 wins"
            }else{
                clear()
                oc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 2 wins"
            }
        }else if result[6] == result[7] && result[7] == result[8] && result[6] != 0{
            if click % 2 == 1{
                clear()
                xc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 1 wins"
            }else{
                clear()
                oc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 2 wins"
            }
        }else if result[0] == result[3] && result[3] == result[6] && result[6] != 0{
            if click % 2 == 1{
                clear()
                xc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 1 wins"
            }else{
                clear()
                oc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 2 wins"
            }
        }else if result[1] == result[4] && result[4] == result[7] && result[4] != 0{
            if click % 2 == 1{
                clear()
                xc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 1 wins"
            }else{
                clear()
                oc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 2 wins"
            }
        }else if result[2] == result[5] && result[5] == result[8] && result[5] != 0{
            if click % 2 == 1{
                clear()
                xc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 1 wins"
            }else{
                clear()
                oc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 2 wins"
            }
        }else if result[0] == result[4] && result[4] == result[8] && result[4] != 0{
            if click % 2 == 1{
                clear()
                xc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 1 wins"
            }else{
                clear()
                oc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 2 wins"
            }
        }else if result[2] == result[4] && result[4] == result[6] && result[2] != 0{
            if click % 2 == 1{
                clear()
                xc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 1 wins"
            }else{
                clear()
                oc++
                xwin.text = " X Wins: \(xc)"
                owin.text = " O Wins: \(oc)"
                return "Player 2 wins"
            }
        }else{
            if click > 8 {
                clear()
                return "Tie"
            }else {
                return ""
            }
        }
    }
    
    func checkboard() -> String {
        if click < 5{
            if result[0] == result[1] && result[1] == result[2] && result[0] != 0{
                if result[0] == 1{
                    clear()
                    xc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "Player wins"
                }else{
                    clear()
                    oc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "AI wins"
                }
            }else if result[3] == result[4] && result[4] == result[5] && result[3] != 0{
                if result[3] == 1{
                    clear()
                    xc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "Player wins"
                }else{
                    clear()
                    oc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "AI wins"
                }
            }else if result[6] == result[7] && result[7] == result[8] && result[6] != 0{
                if result[6] == 1{
                    clear()
                    xc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "Player wins"
                }else{
                    clear()
                    oc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "AI wins"
                }
            }else if result[0] == result[3] && result[3] == result[6] && result[6] != 0{
                if result[0] == 1{
                    clear()
                    xc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "Player wins"
                }else{
                    clear()
                    oc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "AI wins"
                }
            }else if result[1] == result[4] && result[4] == result[7] && result[4] != 0{
                if result[1] == 1{
                    clear()
                    xc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "Player wins"
                }else{
                    clear()
                    oc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "AI wins"
                }
            }else if result[2] == result[5] && result[5] == result[8] && result[5] != 0{
                if result[2] == 1{
                    clear()
                    xc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "Player wins"
                }else{
                    clear()
                    oc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "AI wins"
                }
            }else if result[0] == result[4] && result[4] == result[8] && result[4] != 0{
                if result[0] == 1{
                    clear()
                    xc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "Player wins"
                }else{
                    clear()
                    oc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "AI wins"
                }
            }else if result[2] == result[4] && result[4] == result[6] && result[2] != 0{
                if result[2] == 1{
                    clear()
                    xc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "Player wins"
                }else{
                    clear()
                    oc++
                    xwin.text = " X Wins: \(xc)"
                    owin.text = " O Wins: \(oc)"
                    return "AI wins"
                }
            }
        }else{
            clear()
            return "Tie"
        }
        return ""
    }
    func AIsolve() {
        if result[0] == result[1] && result[0] == 2 && result[2] == 0{
            button3.setTitle("o", forState: UIControlState.Normal)
            result[2] = 2
        }else if result[0] == result[2] && result[0] == 2 && result[1] == 0{
            button2.setTitle("o", forState: UIControlState.Normal)
            result[1] = 2
        }else if result[1] == result[2] && result[1] == 2 && result[0] == 0{
            button1.setTitle("o", forState: UIControlState.Normal)
            result[0] = 2
        }else if result[3] == result[4] && result[3] == 2 && result[5] == 0{
            button6.setTitle("o", forState: UIControlState.Normal)
            result[5] = 2
        }else if result[3] == result[5] && result[3] == 2 && result[4] == 0{
            button5.setTitle("o", forState: UIControlState.Normal)
            result[4] = 2
        }else if result[4] == result[5] && result[4] == 2 && result[3] == 0{
            button4.setTitle("o", forState: UIControlState.Normal)
            result[3] = 2
        }else if result[6] == result[7] && result[6] == 2 && result[8] == 0{
            button9.setTitle("o", forState: UIControlState.Normal)
            result[8] = 2
        }else if result[6] == result[8] && result[6] == 2 && result[7] == 0{
            button8.setTitle("o", forState: UIControlState.Normal)
            result[7] = 2
        }else if result[7] == result[8] && result[7] == 2 && result[6] == 0{
            button7.setTitle("o", forState: UIControlState.Normal)
            result[6] = 2
        }else if result[0] == result[3] && result[0] == 2 && result[6] == 0{
            button7.setTitle("o", forState: UIControlState.Normal)
            result[6] = 2
        }else if result[0] == result[6] && result[0] == 2 && result[3] == 0{
            button4.setTitle("o", forState: UIControlState.Normal)
            result[3] = 2
        }else if result[3] == result[6] && result[3] == 2 && result[0] == 0{
            button1.setTitle("o", forState: UIControlState.Normal)
            result[0] = 2
        }else if result[1] == result[4] && result[1] == 2 && result[7] == 0{
            button8.setTitle("o", forState: UIControlState.Normal)
            result[7] = 2
        }else if result[1] == result[7] && result[1] == 2 && result[4] == 0{
            button5.setTitle("o", forState: UIControlState.Normal)
            result[4] = 2
        }else if result[4] == result[7] && result[4] == 2 && result[1] == 0{
            button2.setTitle("o", forState: UIControlState.Normal)
            result[1] = 2
        }else if result[2] == result[5] && result[2] == 2 && result[8] == 0{
            button9.setTitle("o", forState: UIControlState.Normal)
            result[8] = 2
        }else if result[2] == result[8] && result[2] == 2 && result[5] == 0{
            button6.setTitle("o", forState: UIControlState.Normal)
            result[5] = 2
        }else if result[5] == result[8] && result[5] == 2 && result[2] == 0{
            button3.setTitle("o", forState: UIControlState.Normal)
            result[2] = 2
        }else if result[0] == result[4] && result[0] == 2 && result[8] == 0{
            button9.setTitle("o", forState: UIControlState.Normal)
            result[8] = 2
        }else if result[0] == result[8] && result[0] == 2 && result[4] == 0{
            button5.setTitle("o", forState: UIControlState.Normal)
            result[4] = 2
        }else if result[4] == result[8] && result[4] == 2 && result[0] == 0{
            button1.setTitle("o", forState: UIControlState.Normal)
            result[0] = 2
        }else if result[2] == result[4] && result[2] == 2 && result[6] == 0{
            button7.setTitle("o", forState: UIControlState.Normal)
            result[6] = 2
        }else if result[2] == result[6] && result[2] == 2 && result[4] == 0{
            button5.setTitle("o", forState: UIControlState.Normal)
            result[4] = 2
        }else if result[4] == result[6] && result[4] == 2 && result[2] == 0{
            button3.setTitle("o", forState: UIControlState.Normal)
            result[2] = 2
        }else if result[0] == result[1] && result[0] == 1 && result[2] == 0{
            button3.setTitle("o", forState: UIControlState.Normal)
            result[2] = 2
        }else if result[0] == result[2] && result[0] == 1 && result[1] == 0{
            button2.setTitle("o", forState: UIControlState.Normal)
            result[1] = 2
        }else if result[1] == result[2] && result[1] == 1 && result[0] == 0{
            button1.setTitle("o", forState: UIControlState.Normal)
            result[0] = 2
        }else if result[3] == result[4] && result[3] == 1 && result[5] == 0{
            button6.setTitle("o", forState: UIControlState.Normal)
            result[5] = 2
        }else if result[3] == result[5] && result[3] == 1 && result[4] == 0{
            button5.setTitle("o", forState: UIControlState.Normal)
            result[4] = 2
        }else if result[4] == result[5] && result[4] == 1 && result[3] == 0{
            button4.setTitle("o", forState: UIControlState.Normal)
            result[3] = 2
        }else if result[6] == result[7] && result[6] == 1 && result[8] == 0{
            button9.setTitle("o", forState: UIControlState.Normal)
            result[8] = 2
        }else if result[6] == result[8] && result[6] == 1 && result[7] == 0{
            button8.setTitle("o", forState: UIControlState.Normal)
            result[7] = 2
        }else if result[7] == result[8] && result[7] == 1 && result[6] == 0{
            button7.setTitle("o", forState: UIControlState.Normal)
            result[6] = 2
        }else if result[0] == result[3] && result[0] == 1 && result[6] == 0{
            button7.setTitle("o", forState: UIControlState.Normal)
            result[6] = 2
        }else if result[0] == result[6] && result[0] == 1 && result[3] == 0{
            button4.setTitle("o", forState: UIControlState.Normal)
            result[3] = 2
        }else if result[3] == result[6] && result[3] == 1 && result[0] == 0{
            button1.setTitle("o", forState: UIControlState.Normal)
            result[0] = 2
        }else if result[1] == result[4] && result[1] == 1 && result[7] == 0{
            button8.setTitle("o", forState: UIControlState.Normal)
            result[7] = 2
        }else if result[1] == result[7] && result[1] == 1 && result[4] == 0{
            button5.setTitle("o", forState: UIControlState.Normal)
            result[4] = 2
        }else if result[4] == result[7] && result[4] == 1 && result[1] == 0{
            button2.setTitle("o", forState: UIControlState.Normal)
            result[1] = 2
        }else if result[2] == result[5] && result[2] == 1 && result[8] == 0{
            button9.setTitle("o", forState: UIControlState.Normal)
            result[8] = 2
        }else if result[2] == result[8] && result[2] == 1 && result[5] == 0{
            button6.setTitle("o", forState: UIControlState.Normal)
            result[5] = 2
        }else if result[5] == result[8] && result[5] == 1 && result[2] == 0{
            button3.setTitle("o", forState: UIControlState.Normal)
            result[2] = 2
        }else if result[0] == result[4] && result[0] == 1 && result[8] == 0{
            button9.setTitle("o", forState: UIControlState.Normal)
            result[8] = 2
        }else if result[0] == result[8] && result[0] == 1 && result[4] == 0{
            button5.setTitle("o", forState: UIControlState.Normal)
            result[4] = 2
        }else if result[4] == result[8] && result[4] == 1 && result[0] == 0{
            button1.setTitle("o", forState: UIControlState.Normal)
            result[0] = 2
        }else if result[2] == result[4] && result[2] == 1 && result[6] == 0{
            button7.setTitle("o", forState: UIControlState.Normal)
            result[6] = 2
        }else if result[2] == result[6] && result[2] == 1 && result[4] == 0{
            button5.setTitle("o", forState: UIControlState.Normal)
            result[4] = 2
        }else if result[4] == result[6] && result[4] == 1 && result[2] == 0{
            button3.setTitle("o", forState: UIControlState.Normal)
            result[2] = 2
        }else{
            var temp = Int(arc4random() % 9)
            var but = temp
            while result[but] != 0 && click < 5{
                but = Int(arc4random() % 9)
            }
            if but == 0{
                button1.setTitle("o", forState: UIControlState.Normal)
                result[0] = 2
            }else if but == 1{
                button2.setTitle("o", forState: UIControlState.Normal)
                result[1] = 2
            }else if but == 2{
                button3.setTitle("o", forState: UIControlState.Normal)
                result[2] = 2
            }else if but == 3{
                button4.setTitle("o", forState: UIControlState.Normal)
                result[3] = 2
            }else if but == 4{
                button5.setTitle("o", forState: UIControlState.Normal)
                result[4] = 2
            }else if but == 5{
                button6.setTitle("o", forState: UIControlState.Normal)
                result[5] = 2
            }else if but == 6{
                button7.setTitle("o", forState: UIControlState.Normal)
                result[6] = 2
            }else if but == 7{
                button8.setTitle("o", forState: UIControlState.Normal)
                result[7] = 2
            }else if but == 8{
                button9.setTitle("o", forState: UIControlState.Normal)
                result[8] = 2
            }
        }
    }
}







