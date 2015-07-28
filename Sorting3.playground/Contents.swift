//: Playground - noun: a place where people can play

//import UIKit

//var str = "Hello, playground"

var lists = [53, 13, 34, 51, 32,64,27,81,94,94,78,23,78,12,34,2,13,34,54,76,94,67,12,34,54,78]

var list1 = [78, 78, 78, 78, 78, 78, 78, 78]

/*
func quicksort(var list: Array<Int>) -> Array<Int>{
    var left: [Int] = []
    var right: [Int] = []
    if(list.count < 2){
        return list
    }else{
        var Mid = list.removeAtIndex(0)
        for y in list{
            if(y <= Mid){
                left.append(y)
            }else{
                right.append(y)
            }
        }
        return quicksort(left) + [Mid] + quicksort(right)
    }
}
println(quicksort(lists))
*/


func quickSort(var list: Array<Int>) -> Array<Int> {
    
    var left: [Int] = []
    var right: [Int] = []
    
    if (list.count > 1){
        var Mid = list.removeAtIndex(0)
        
        for x in list {
            if x <= Mid{
                left.append(x)
            }else{
                right.append(x)
            }
        }
        return quickSort(left) + [Mid] + quickSort(right)
        
    }else{
        return list
    }
}
println(quickSort(list1))

func quickquickSort(var list: Array<Int>) -> Array<Int> {
    
    var left: [Int] = []
    var mid: [Int] = []
    var right: [Int] = []
    
    if (list.count > 1){
        var Mid = list[0]
        
        for x in list {
            if x < Mid{
                left.append(x)
            }else if x == Mid{
                mid.append(x)
            }else{
                right.append(x)
            }
        }
        return quickSort(left) + mid + quickSort(right)
        
    }else{
        return list
    }
}
println(quickquickSort(list1))

