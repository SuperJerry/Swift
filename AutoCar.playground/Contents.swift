//: Auto-tilenum,color,weight,velocity

public class Auto{
    public func velocity(){
        println("Accelerate")
        println("Decelerate")
        println("Stop")
    }
    private var color = "white"
    private var weight = "1 ton"
    private var tilenum = 4
    
    public init(){
        
    }
}

var Audi = Auto()
Audi.velocity()
Audi.color = "black"
println(Audi.color)
Audi.weight = "2 ton"
Audi.tilenum = 4

var tank = Auto()
tank.velocity()
tank.color = "green"
println(tank.color)
tank.weight = "10 ton"
tank.tilenum = 10

public class car: Auto{
    public func CD(){
        println("Wangfeng")
    }
    private var aircondition = "cold"
}
 var toyota = car()
toyota.velocity()
toyota.color = "white"
println(toyota.color)
toyota.weight = "1 ton"
toyota.tilenum = 4
toyota.CD()
toyota.aircondition = "warm"















