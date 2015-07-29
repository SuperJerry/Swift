//: Playground - noun: a place where people can play

//import UIKit

//var str = "Hello, playground"

//0
func num(input: String) -> Int{
    return input.toInt()!
}
//println(num("123"))

//1
class Node <T: Equatable>{
    var value: T
    var next: Node? = nil
    init(_ value: T){
        self.value = value
    }
}
public class Linkedlist<T: Equatable>{
    var head: Node<T>? = nil
    func Insertathead(value: T){
        if head == nil{
            self.head = Node(value)
        }else{
            let newNode = Node(value)
            newNode.next = head
            self.head = newNode
        }
    }
    func Insertattail(value:T){
        if head == nil{
            self.head = Node(value)
        }else{
            var lastNode = head
            while lastNode?.next != nil{
                lastNode = lastNode?.next
            }
            let newNode = Node(value)
            lastNode?.next = newNode
        }
    }
    func remove(value: T){
        if head != nil{
            var node = head
            var previousnode: Node<T>? = nil
            while node?.value != value && node?.next != nil{
                previousnode = node
                node = node?.next
            }
            if node?.value == value{
                if node?.next != nil{
                    previousnode?.next = node?.next
                }else{
                    previousnode?.next = nil
                }
            }
        }
    }
    
    var description : String{
        var node = head
        var description = "\(node!.value)"
        while node?.next != nil{
            node = node?.next
            description += ",\(node!.value)"
        }
        return description
    }
    var temp: Node<T>? = nil
    
    
    
    func reverse(){
        while(head != nil){
            //find lastNode in head
            var lastNode = head
            var preLast = lastNode
            while lastNode?.next != nil {
                preLast = lastNode
                lastNode = lastNode?.next
            }
            
            //lastnode insert in temp
            if temp == nil{
                self.temp = lastNode
                preLast?.next = nil
                //delete lastnode from head
                //var previousnode: Node<T>? = nil
                //if previousnode.next = lastNode {
                //previousnode?.next = nil
                //}
            }else{
                var last = temp
                while last?.next != nil{
                    last = last?.next
                }
                let new = lastNode
                last?.next = new
                preLast?.next = nil
                
            }
        }
        head = temp
    }
}
println("23")
var listInt = Linkedlist<Int>()
listInt.Insertathead(20)
listInt.Insertattail(30)
listInt.Insertattail(40)
listInt.Insertathead(10)
listInt.Insertathead(0)
listInt.description
println(listInt.description)
//listInt.reverse()





