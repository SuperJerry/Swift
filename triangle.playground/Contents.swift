//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//for index in 0...100{
//    var result = sin(CGFloat(index))
//    
//}
for var i: Double = 0; i < 50; i += 0.1{
    var result1 = sin(i)
    var result2 = sin(2 * i)
    var result3 = sin(3 * i)
    var result4 = result1 + result2 + result3
}