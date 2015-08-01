//
//  Array2D.swift
//  Cookie_Crush
//
//  Created by XuChen on 15/1/11.
//  Copyright (c) 2015年 TopHacker. All rights reserved.
//

class Array2D<T> {
    let columns: Int
    let rows: Int
    private var array: Array<T?>    //private
    
    init(column: Int, row: Int) {
        self.columns = column
        self.rows = row
        array = Array<T?>(count: columns * rows, repeatedValue: nil)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[row * columns + column]
        }
        set {
            array[row * columns + column] = newValue
        }
    }
    
}
