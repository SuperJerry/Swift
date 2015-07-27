//: Playground - noun: a place where people can play

//import UIKit

var list = [5,11,3,7,2,6,8,8,2,5,12,65,11,1,5,6]
//println(list)


func insertSort(){
    var x,y,key: Int
    for (x = 0; x < list.count; x++){
        key = list[x]
        for(y = x; y < list.count; y++){
            if(key > list[y]){
                var temp = list[y]
                list[y] = list[x]
                list[x] = temp
                key = temp
            }
        }
    }
}
//insertSort()
//println(list)
/*func tkfail(){
    var x,y,key: Int
    var n = 0
    var temp = list
    for(x = 0; x < list.count; x++){
        key = list[x]
        n = 0
        for(y = 0; y < list.count; y++){
            if(key > list[y]){
                n++
            }
        }
        temp[n] = key
    }
    list = temp
}
*/
//tkfail()
//println(list)

func tkSort(){
    var x,y,key,tr,tl: Int
    var temp = list
    var n = 0
    for(x = 0; x < list.count; x++){
        key = list[x]
        tl = 0
        tr = list.count - 1
        for(y = 0; y < list.count; y++){
            if(key > list[y]){
                tl++
            }else if(key < list[y]){
                tr--
            }
        }
        if(tr == tl){
            temp[tr] = key
        }else{
            for(n = tl; n < tr + 1; n++){
                temp[n] = key
            }
        }
    }
    list = temp
}
tkSort()
println(list)







