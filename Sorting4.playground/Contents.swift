//: Playground - noun: a place where people can play

//import UIKit

//var str = "Hello, playground"

var list = [23,12,43,12,45,57,34,67]

func MergeSorting(input:[Int]) -> [Int]{
    if (input.count > 1){
        //println(input.count)
        var mid = Int(input.count/2)
        var x = 0
        var left: [Int] = []
        var right: [Int] = []
        for x = 0; x < mid; x++ {
            left.append(input[x])
        }
        for x = mid; x < input.count; x++ {
            right.append(input[x])
        }
        //println(left)
        //println(right)
        let Left = MergeSorting(left)
        let Right = MergeSorting(right)
        //println(Right)
        return SortforMergeSorting(Left, Right)
        
    }else{
        return input
    }
}

func SortforMergeSorting(left: Array<Int>, right: Array<Int>) -> Array<Int> {
    var temp : [Int] = []
    var sleft = left
    var sright = right
    while (sleft.count + sright.count != 0){
        if sleft.count == 0{
            temp += sright
            break
        }else if sright.count == 0{
            temp += sleft
            break
        }else if sleft[0] < sright[0]{
            temp.append(sleft[0])
            sleft.removeAtIndex(0)
        }else if sleft[0] > sright[0]{
            temp.append(sright[0])
            sright.removeAtIndex(0)
        }else{
            temp.append(sleft[0])
            temp.append(sright[0])
            sleft.removeAtIndex(0)
            sright.removeAtIndex(0)
        }
    }
    return temp
}

//MergeSorting(list)
println(MergeSorting(list))
