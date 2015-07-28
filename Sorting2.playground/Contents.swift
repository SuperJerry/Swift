//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
var list = [9,8,7,5,6,4,3,2,4,2,7,5]

func bubblesort(){
    var x,y,key,temp: Int
    for(x = 0; x < list.count; x++){
        for(y = 0; y < list.count - x - 1; y++){
            if(list[y]) > list[y+1]{
                temp = list[y]
                list[y] = list[y+1]
                list[y+1] = temp
            }
        }
    }
}

bubblesort()
println(list)
