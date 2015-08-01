//
//  Swap.swift
//  Cookie_Crush
//
//  Created by XuChen on 15/1/12.
//  Copyright (c) 2015年 TopHacker. All rights reserved.
//

struct Swap: Printable, Hashable {
    let cookieA: Cookie
    let cookieB: Cookie
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    var description: String {
        return "Swap \(cookieA) with \(cookieB)"
    }
    
    var hashValue: Int {
        return cookieA.hashValue ^ cookieB.hashValue
    }
}

func ==(lhs: Swap, rhs: Swap) -> Bool {
    return lhs.cookieA == rhs.cookieA && lhs.cookieB == rhs.cookieB ||
        lhs.cookieB == rhs.cookieA && lhs.cookieA == rhs.cookieB
}

