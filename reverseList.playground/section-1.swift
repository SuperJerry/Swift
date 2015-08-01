
public class Node<T: Equatable> {
    var value: T
    var next: Node? = nil
    
    init(_ value: T){
        self.value = value
    }
}
public class LinkedList<T: Equatable> {
    
    var head: Node<T>? = nil

    var Thead: Node<T>? = nil

    
    func insertAtHead(value: T){
        if head == nil{
            self.head = Node(value)
        }else{
            let newNode = Node(value)
            newNode.next = head
            self.head = newNode
        }
    }
    
    func insertAtTail(value: T){
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
        if head != nil {
            var node =  head
            var previousNode: Node<T>? = nil
            
            //判断node节点的值是否为所求值，并且node节点的next不为空
            while node?.value != value && node?.next != nil {
                previousNode = node
                node = node?.next
            }
            if node?.value == value {
                if node?.next != nil{
                    previousNode?.next = node?.next
                }else {
                    previousNode?.next = nil
                }
            }
        }
        
    }
    
    var description : String{
        var node = head
        var description = "\(node?.value)"
        while node?.next != nil{
            node = node?.next
            description += " \(node?.value)"
        }
        
        return description
    }
    
    func reverse() {
        var Tlast = Thead
        //Thead?.next = Tlast
        
        if(Thead == nil){
            var last = head
            var lastPrev = last
            while last?.next != nil{
                lastPrev = last
                last = last?.next
                //println(last?.value)
            }
            //var Tvalue = (last?.value)!
            Thead = last
            lastPrev?.next = nil
            
            //println((Thead?.value)!)
        }
        
        while head?.next != nil{
    
            var last = head
            var lastPrev = last
            while last?.next != nil{
                lastPrev = last
                last = last?.next
                //println(last?.value)
            }
            var Tvalue = (last?.value)!
            var TlastNode = Thead
            while TlastNode?.next != nil{
                TlastNode = TlastNode?.next
            }
            let TnewNode = Node(Tvalue)
            TlastNode?.next = TnewNode

            //println(TlastNode?.value)
            lastPrev?.next = nil
            
        }
        if head?.next == nil{
            var Tvalue = (head?.value)!
            var TlastNode = Thead
            while TlastNode?.next != nil{
                TlastNode = TlastNode?.next
            }
            let TnewNode = Node(Tvalue)
            TlastNode?.next = TnewNode
            head = nil
        }
        
        head = Thead

    }
    
    
}

var listInt = LinkedList<Int>()

listInt.insertAtHead(60)
listInt.insertAtHead(40)
listInt.insertAtHead(30)
listInt.insertAtHead(20)
listInt.insertAtHead(10)

println(listInt.description)

listInt.reverse()
    
println(listInt.description)

/*
listInt.remove(20)

listInt.description
listInt.insertAtTail(40)
listInt.description

var listStr = LinkedList<String>()

listStr.insertAtTail("Tom")
listStr.insertAtTail("Jerry")
listStr.insertAtTail("Swift")
listStr.description
listStr.remove("Jerry")
println(listStr.description)
*/
