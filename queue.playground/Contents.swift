//: Playground - noun: a place where people can play

//import UIKit

//var str = "Hello, playground"
//println("hah")

public class Queue{
    var items: [Int] = []
    
    public func enqueue(value:Int){
        items.append(value)
    }
    
    public func dequeue() ->Int?{
        if items.count > 0{
            let obj = items.removeAtIndex(0)
            return obj
        }else{
            return nil
        }
    }
    public func isEmpty() -> Bool{
        if items.count > 0 {
            return false
        }else{
            return true
        }
    }
    var description:String{
        var description = ""
        if isEmpty() == false {
            let tempItem = self.items
            while !(self.isEmpty()){
                description += "\(self.dequeue()!)"
            }
            self.items = tempItem
        }
        return description
    }
}

var queue = Queue()
queue.isEmpty()
println(queue.isEmpty())
//println("hah")

queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(5)
queue.enqueue(8)
queue.dequeue()
queue.description
println(queue.description)








