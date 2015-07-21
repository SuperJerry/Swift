//: Playground - noun: a place where people can play

//import UIKit

//var str = "Hello, playground"

//push, top, pop
//first in last out

public class Stack {
    var items: [Int] = []
    
    public func push(value : Int){
        items.append(value)
    }
    
    public func top() -> Int?{
        let value = items.last
        if value != nil{
            return value
        }
        return nil
    }
    
    public func pop() -> Int?{
        if let value = self.top(){
            items.removeLast()
            return value
        }
        return nil
    }
}

var stack = Stack()
stack.push(1)
stack.push(3)
stack.push(5)
println(stack.top()!)
stack.pop()
println(stack.top()!)
stack.pop()
stack.pop()











