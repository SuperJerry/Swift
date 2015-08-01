//
//  GameViewController.swift
//  CookieCrunch
//
//  Created by Matthijs on 19-06-14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
  // The scene draws the tiles and cookie sprites, and handles swipes.
  var scene: GameScene!

  // The level contains the tiles, the cookies, and most of the gameplay logic.
  // Needs to be ! because it's not set in init() but in viewDidLoad().
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

    // Configure the view.
    let skView = view as! SKView
    skView.multipleTouchEnabled = false

    // Create and configure the scene.
    scene = GameScene(size: skView.bounds.size)
    scene.scaleMode = .AspectFill

    // Load the level.
    level = Level(filename: "Level_1")
    scene.level = level
    scene.addTiles()
    scene.swipeHandler = handleSwipe

    // Present the scene.
    skView.presentScene(scene)

    // Let's start the game!
    beginGame()
  }

  func beginGame() {
    shuffle()
  }

  func shuffle() {
    // Fill up the level with new cookies, and create sprites for them.
    let newCookies = level.shuffle()
    scene.addSpritesForCookies(newCookies)
  }

  // This is the swipe handler. MyScene invokes this function whenever it
  // detects that the player performs a swipe.
  func handleSwipe(swap: Swap) {
    // While cookies are being matched and new cookies fall down to fill up
    // the holes, we don't want the player to tap on anything.
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
