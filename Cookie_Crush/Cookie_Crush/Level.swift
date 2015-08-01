//
//  Level.swift
//  Cookie_Crush
//
//  Created by XuChen on 15/1/11.
//  Copyright (c) 2015年 TopHacker. All rights reserved.
//

import Foundation

let NumColumns = 9
let NumRows = 9

class Level {
    
    private var possibleSwaps = Set<Swap>()
    
    let cookies = Array2D<Cookie>(column: NumColumns, row: NumRows) //private
    let tiles = Array2D<Tile>(column: NumColumns, row: NumRows)
    
    init(filename: String) {
        if let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename) {
            if let tilesArray: AnyObject = dictionary["tiles"] {
                for (row, rowArray) in enumerate(tilesArray as! [[Int]]) {
                    let tileRow = NumRows - row - 1
                    
                    for (column, value) in enumerate(rowArray) {
                        if value == 1 {
                            tiles[column, tileRow] = Tile()
                        }
                    }
                }
            }
        }
    }
    
    func cookieAtColumn(column: Int, row: Int) ->Cookie? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    
    func tileAtColumn(column: Int, row: Int) ->Tile? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return tiles[column, row]
    }
    
    func shuffle() -> Set<Cookie> {
        var set: Set<Cookie>
        do {
            set = createInitialCookies()
            detectPossibleSwaps()
            println("Possible swaps: \(possibleSwaps)")
        }
        while possibleSwaps.count == 0
        return createInitialCookies()
    }
    
    func createInitialCookies() -> Set<Cookie>{
        var set = Set<Cookie>()
        
        for row in 0...NumRows - 1 {
            for column in 0...NumColumns - 1 {
                if tiles[column, row] != nil {
                    var cookieType:CookieType
                    do {
                         cookieType = CookieType.random()
                    }
                    while (column >= 2 && cookies[column - 1, row]?.cookieType == cookieType &&
                        cookies[column - 2, row]?.cookieType == cookieType) || (row >= 2 &&
                            cookies[column, row - 1]?.cookieType == cookieType &&
                            cookies[column, row - 2]?.cookieType == cookieType)
                    
                    let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                    cookies[column, row] = cookie
                    
                    set.insert(cookie)
                }
            }
        }
        return set
    }
    
    func performSwap(swap: Swap) {
        let columnA = swap.cookieA.column
        let rowA = swap.cookieA.row
        let columnB = swap.cookieB.column
        let rowB = swap.cookieB.row
        
        cookies[columnA, rowA] = swap.cookieB
        swap.cookieB.column = columnA
        swap.cookieB.row = rowA
        
        cookies[columnB, rowB] = swap.cookieA
        swap.cookieA.column = columnB
        swap.cookieA.row = rowB
    }
    
    func detectPossibleSwaps() {
        var set = Set<Swap>()
        for row in 0...NumRows - 1 {
            for column in 0...NumColumns - 1 {
                if let cookie = cookies[column, row] {
                    //检测逻辑
                    
                    // Is it possible to swap this cookie with the one on the right?
                    if column < NumColumns - 1 {
                        // Have a cookie in this spot? If there is no tile, there is no cookie.
                        if let other = cookies[column + 1, row] {
                            // Swap them
                            cookies[column, row] = other
                            cookies[column + 1, row] = cookie
                            
                            // Is either cookie now part of a chain?
                            if hasChainAtColumn(column + 1, row: row) ||
                                hasChainAtColumn(column, row: row) {
                                    set.insert(Swap(cookieA: cookie, cookieB: other))
                            }
                            
                            // Swap them back
                            cookies[column, row] = cookie
                            cookies[column + 1, row] = other
                        }
                    }
                    
                    if row < NumRows - 1 {
                        if let other = cookies[column, row + 1] {
                            cookies[column, row] = other
                            cookies[column, row + 1] = cookie
                            
                            // Is either cookie now part of a chain?
                            if hasChainAtColumn(column, row: row + 1) ||
                                hasChainAtColumn(column, row: row) {
                                    set.insert(Swap(cookieA: cookie, cookieB: other))
                            }
                            
                            // Swap them back
                            cookies[column, row] = cookie
                            cookies[column, row + 1] = other
                        }
                    }
                }
            }
        }
         possibleSwaps = set
    }
    
    func isPossibleSwap(swap: Swap) -> Bool {
        return possibleSwaps.contains(swap)
    }
    
    //看一个Cookie是否是Chain的一部分
    private func hasChainAtColumn(column: Int, row: Int) -> Bool {
        let cookieType = cookies[column, row]!.cookieType
        
        var horzLength = 1
        for var i = column - 1; i >= 0 && cookies[i, row]?.cookieType == cookieType; --i, ++horzLength {
            
        }
        for var i = column + 1; i < NumColumns && cookies[i, row]?.cookieType == cookieType; ++i, ++horzLength {
            
        }
        if horzLength >= 3 {
            return true
        }
        
        var vertLength = 1
        for var i = row - 1; i >= 0 && cookies[column, i]?.cookieType == cookieType; --i, ++vertLength {
        
        }
        for var i = row + 1; i < NumRows && cookies[column, i]?.cookieType == cookieType; ++i, ++vertLength {
            
        }
        return vertLength >= 3
        
    }
    
}