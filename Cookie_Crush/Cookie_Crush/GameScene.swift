//
//  GameScene.swift
//  Cookie_Crush
//
//  Created by XuChen on 15/1/11.
//  Copyright (c) 2015年 TopHacker. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let TileWidth: CGFloat = 32.0
    let TileHeight: CGFloat = 36.0
    
    let gameLayer = SKNode()
    let cookiesLayer = SKNode()
    let tilesLayer = SKNode()
    
    var level:Level!
    var swipeFromColumn: Int?
    var swipeFromRow: Int?
    var swipeHandler: ((Swap) -> Void)?
    
    var selectionSprite = SKSpriteNode()
    override init(size: CGSize) {
        super.init(size: size)
            self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
            //设置背景
            let background = SKSpriteNode(imageNamed: "Background")
            self.addChild(background)
        
            self.addChild(gameLayer)
            let layerPosition = CGPoint(x: -TileWidth * CGFloat(NumColumns) / 2, y: -TileHeight * CGFloat(NumRows) / 2)
            cookiesLayer.position = layerPosition
            tilesLayer.position = layerPosition
            gameLayer.addChild(tilesLayer)
            gameLayer.addChild(cookiesLayer)
        
        
            //初始化滑动
            self.swipeFromColumn = nil
            self.swipeFromRow = nil
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
        let location = touch.locationInNode(cookiesLayer)
        
        let (success, column, row) = convertPoint(location)
        if success {
            if let cookie = level.cookieAtColumn(column, row: row) {
                self.showSelectionIndicatorForCookie(cookie)
                swipeFromColumn = column
                swipeFromRow = row
            }
        }

    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        if swipeFromColumn == nil { return }
        
        let touch = touches.first as! UITouch
        let location = touch.locationInNode(cookiesLayer)
        
        let (success, column, row) = self.convertPoint(location)
        
        if success {
            var horzDelta = 0, vertDelta = 0
            if column < swipeFromColumn! {          //左滑
                horzDelta = -1
            }else if column > swipeFromColumn {     //右滑
                horzDelta = 1
            }else if row < swipeFromRow {   //下滑
                vertDelta = -1
            }else if row > swipeFromRow {     //上滑
                vertDelta = 1
            }
            
            if horzDelta != 0 || vertDelta != 0 {
               self.trySwapHorizontal(horzDelta, vertDelta: vertDelta)
               self.hideSelectionIndicator()
                swipeFromColumn = nil
            }
        }

    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        if selectionSprite.parent != nil && swipeFromColumn != nil {
            self.hideSelectionIndicator()
        }
        swipeFromColumn = nil
        swipeFromRow = nil
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        touchesEnded(touches, withEvent: event)

    }
    func addSpritesForCookies(cookies: Set<Cookie>) {
        for cookie in cookies {
            let sprite = SKSpriteNode(imageNamed: cookie.cookieType.spriteName)
            sprite.position = pointForColumn(cookie.column, row: cookie.row)
            cookiesLayer.addChild(sprite)
            cookie.sprite = sprite
        }
    }
    
    func trySwapHorizontal(horzDelta: Int, vertDelta: Int) {
        let toColumn = swipeFromColumn! + horzDelta
        let toRow = swipeFromRow! + vertDelta
        
        if toColumn < 0 || toColumn >= NumColumns { return }
        if toRow < 0 || toRow >= NumRows { return }
        
        if let toCookie = level.cookieAtColumn(toColumn, row: toRow) {
            if let fromCookie = level.cookieAtColumn(swipeFromColumn!, row: swipeFromRow!) {
                
                println("Swap from \(fromCookie) with \(toCookie)")
                if let handler = swipeHandler {
                    let swap = Swap(cookieA: fromCookie, cookieB: toCookie)
                    handler(swap)
                }
            }
        }
    }
    
    func animateSwap(swap: Swap, completion: () -> Void) {
        let spriteA = swap.cookieA.sprite!
        let spriteB = swap.cookieB.sprite!
        
        spriteA.zPosition = 100
        spriteB.zPosition = 90
        
        let Duration: NSTimeInterval = 0.3
        
        let moveA = SKAction.moveTo(spriteB.position, duration: Duration)
        moveA.timingMode = .EaseOut
        spriteA.runAction(moveA, completion: completion)
        
        let moveB = SKAction.moveTo(spriteA.position, duration: Duration)
        moveB.timingMode = .EaseOut
        spriteB.runAction(moveB)
    }
    
    func showSelectionIndicatorForCookie(cookie: Cookie) {
        if selectionSprite.parent != nil {
            selectionSprite.removeFromParent()
        }
        if let sprite = cookie.sprite {
            let texture = SKTexture(imageNamed: cookie.cookieType.highlightedSpriteName)
            selectionSprite.size = texture.size()
            selectionSprite.runAction(SKAction.setTexture(texture))
            sprite.addChild(selectionSprite)
            selectionSprite.alpha = 1.0
        }
    }
    
    func hideSelectionIndicator() {
        selectionSprite.runAction(SKAction.sequence([SKAction.fadeOutWithDuration(0.3), SKAction.removeFromParent()]))
    }
    
    func pointForColumn(column: Int, row: Int) -> CGPoint {
        return CGPoint(x:CGFloat(column) * TileWidth + TileWidth / 2, y: CGFloat(row) * TileHeight + TileWidth / 2)
    }
    
    func convertPoint(point: CGPoint) -> (success: Bool, column: Int, row: Int) {
        if point.x >= 0 && point.x < CGFloat(NumColumns) * TileWidth &&
            point.y >= 0 && point.y < CGFloat(NumRows) * TileHeight {
            return (true, Int(point.x / TileWidth), Int(point.y / TileHeight))
        }else {
            return (false, 0, 0) //无效位置
        }
    }
    
    func addTile() {
        for row in 0...NumRows - 1 {
            for column in 0...NumColumns - 1 {
                if let tile = level.tileAtColumn(column, row: row) {
                    let tileNode = SKSpriteNode(imageNamed: "Tile")
                    tileNode.position = pointForColumn(column, row: row)
                    tilesLayer.addChild(tileNode)
                }
            }
        }
    }
    
    func animateInvalidSwap(swap: Swap, completion: () -> ()) {
        let spriteA = swap.cookieA.sprite!
        let spriteB = swap.cookieB.sprite!
        
        spriteA.zPosition = 100
        spriteB.zPosition = 90
        
        let Duration: NSTimeInterval = 0.2
        
        let moveA = SKAction.moveTo(spriteB.position, duration: Duration)
        moveA.timingMode = .EaseOut
        
        let moveB = SKAction.moveTo(spriteA.position, duration: Duration)
        moveB.timingMode = .EaseOut
        
        spriteA.runAction(SKAction.sequence([moveA, moveB]), completion: completion)
        spriteB.runAction(SKAction.sequence([moveB, moveA]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
