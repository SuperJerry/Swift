//
//  GameViewController.swift
//  Cookie_Crush
//
//  Created by XuChen on 15/1/11.
//  Copyright (c) 2015年 TopHacker. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var scene: GameScene!
    var level: Level!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //设置视图
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        skView.showsNodeCount = true
        skView.showsFPS = true
        
        //创建和设置场景
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        //设置等级
        level = Level(filename: "Level_1")
        scene.level = level
        scene.addTile()
        
        //设置滑动处理
        scene.swipeHandler = self.handleSwipe
        
        //展示场景
        skView.presentScene(scene)
        
        //开始游戏
        self.beginGame()
    }
    
    func beginGame() {
        shuffle()
    }
    
    func shuffle() {
        let newCookies = level.shuffle()
        scene.addSpritesForCookies(newCookies)
    }
    
    func handleSwipe(swap: Swap) {
        view.userInteractionEnabled = false
        
        if level.isPossibleSwap(swap) {
            level.performSwap(swap)
            scene.animateSwap(swap) {
                self.view.userInteractionEnabled = true
            }
        } else {
            scene.animateInvalidSwap(swap) {
                self.view.userInteractionEnabled = true
            }

        }
    }
}