//: Playground - noun: a place where people can play

//import UIKit

//var str = "Hello, playground"

var list = [1,2,3,5,8,13,21,34,55,89,144,233,377,610]

public func linear(key: Int){
    for number in list {
        if number == key{
            var result = "value \(key) found"
            println(result)
            //break
            return
        }
    }
    println("value \(key) not found")
}

//linear(144)

func round(n: Double)-> Double{
    if Int(2*n) > 2*Int(n){
        return Double(Int(n+1))
    }
    return Double(Int(n))
}
//println(round(2.9999))

public func log(key: Int, imin: Int, imax: Int){
    if (imin == imax) && (list[imin] != key) {
        println("not found")
        return
    }

    var midindex: Double = round(Double((imin + imax) / 2))
    var midnumber = list[Int(midindex)]
    
    if midnumber > key {
        log(key, imin, Int(midindex)-1)
    }else if midnumber < key{
        log(key, Int(midindex) + 1, imax)
    }else{
        var result = "value \(key) found"
        println(result)
    }
}


log(233, 0, 13)
//isFound







