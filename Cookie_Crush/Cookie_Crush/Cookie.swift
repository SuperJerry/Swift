//
//  Cookie.swift
//  Cookie_Crush
//
//  Created by XuChen on 15/1/11.
//  Copyright (c) 2015年 TopHacker. All rights reserved.
//

import SpriteKit

enum CookieType: Int, Printable {
    case Unknown = 0
    case Croissant = 1
    case Cupcake = 2
    case Danish = 3
    case Donut = 4
    case Macaroon = 5
    case SugarCookie = 6
    
    var spriteName: String {
        let spriteNames = [
            "Croissant",
            "Cupcake",
            "Danish",
            "Donut",
            "Macaroon",
            "SugarCookie"
        ]
        
        return spriteNames[rawValue - 1]
    }
    
    var highlightedSpriteName: String {
        let highlightedSpriteNames = [
            "Croissant-Highlighted",
            "Cupcake-Highlighted",
            "Danish-Highlighted",
            "Donut-Highlighted",
            "Macaroon-Highlighted",
            "SugarCookie-Highlighted"
        ]
        
        return highlightedSpriteNames[ rawValue - 1]
    }
    
    static func random() -> CookieType {
        return CookieType(rawValue: Int(arc4random_uniform(6) + 1))!
    }
    
    var description: String {
        return spriteName
    }
}

class Cookie: Printable, Hashable {
    var column: Int
    var row: Int
    let cookieType: CookieType
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int, cookieType: CookieType) {
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }
    
    var description: String {
        return "Type:\(cookieType) Square:(\(column), \(row))"
    }
    
    var hashValue: Int {
        return row * 10 + column
    }
}

func ==(lhs: Cookie, rhs: Cookie) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}
