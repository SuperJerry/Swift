//: Playground - noun: a place where people can play

//import UIKit

//var str = "Hello, playground"

public func f(N: Int){
    if N > 1{
        f(N - 1)
    }
    println(N)
}

//f(3)
//f(3)--f(2)+3
//f(2)--f(1)+2
//f(1)--f(0)+1

//1 3 5 ...
public func h(N: Int){
    if N > 1{
        h(N - 1)
    }
    println(2 * N - 1)
}

//h(3)
//h(7)

//!
public func j(N: Int) -> Int{
    if N > 1{
        return N * j(N-1)
    }
    return 1
}

//println(j(1))


//fib: 1 1 2 3 5 ...
public func g(N: Int) -> Int {
    if N > 2{
         return g(N - 1) + g(N - 2)
        
    }
    return 1
    //println()
}
//g(7)
//println(g(7))

var items: [Int] = []
public func fib(N: Int) {
    items.append(1)
    items.append(1)
    println(1)
    println(1)
    var i = 2
    while i < N {
        items.append(items[i-1] + items[i-2])
        println(items[i])
        i = i + 1
    }
}

//fib(20)

var item: [Int] = []
public func multi(N: Int) {
    item.append(1)
    //println(1)
    var i = 1
    while i < N{
        item.append((i + 1) * item[i-1])
        println(item[i])
        i = i + 1
    }
}

//multi(5)

public func gcd(a: Int, b: Int) ->Int{
    if a < b{
        return gcd(a, b - a)
    }else if a > b{
        return gcd(a - b, b)
    }else{
        return a
    }
}

println(gcd(1001,2401))





