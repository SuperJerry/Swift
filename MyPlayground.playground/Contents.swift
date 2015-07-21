//: ad
/*
HaHaHa
*/

public class dog{
    public func bark(){
        println("open mouth")
        println("Wolf! Wolf!")
        println("Shut mouth")
    }
    private var color = "red"
    private var isPreg: Bool
    
    public init(){
        self.isPreg = false
    }
}

var Dahuang = dog()

Dahuang.bark()
Dahuang.color = "yellow"
Dahuang.isPreg = true
println(Dahuang.color)

class huntaway: dog{
    public func hunt(){
        println("hunting!")
    }
}

var Xiaohuang = huntaway()

Xiaohuang.bark()
Xiaohuang.color = "green"
Xiaohuang.hunt()

public class chihuahua : dog{
    override public func bark() {
        println("Ji!Ji!")
    }
}
var Wangcai = chihuahua()

Dahuang.bark()
Wangcai.bark()
Xiaohuang.bark()

public class chicken{
    public func bark(){
        println("Ge,Ge,Ge")
    }
    private var color = "Red"
    private var move = "fly"
    public init(){
        
    }
}
var France = chicken()

Dahuang.bark()
Wangcai.bark()
France.bark()















