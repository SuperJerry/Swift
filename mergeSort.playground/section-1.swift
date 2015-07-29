var randomNumbers = [42, 12, 88, 62, 63, 56, 1, 77, 88, 97, 97, 20, 45, 91, 62, 2, 15, 31, 59, 5]
var list = [5, 2, 1, 3, 4]
//var k = 2
//println(randomNumbers[0...k-1])
//println(7/2)
//把一个无序的数组排成有序

func mergeSort (input : Array<Int>) -> Array<Int>
{
    if input.count < 2 {
        return input
    }
    
    let mid = input.count/2
    var x = 0
    var left: [Int] = []
    var right: [Int] = []
    for x = 0; x < mid; x++ {
        left.append(input[x])
    }
    for x = mid; x < input.count; x++ {
        right.append(input[x])
    }
    //let left = Array(input[0...mid-1])
    //let right = Array(input[mid...input.count-1])
    println(left)
    var leftSorted = mergeSort(left)
    var rightSorted = mergeSort(right)
    
    return mergeTwoArray(leftSorted, rightSorted)
}

//将两个有序的数组合并成一个有序的数组
func mergeTwoArray(left: Array<Int>, right: Array<Int>) -> Array<Int>{

    var temp: [Int] = []
    var tleft = left
    var tright = right
    
    while (tleft.count + tright.count) != 0 {
        if tleft.count == 0{
            temp += tright
            break
        }else if tright.count == 0{
            temp += tleft
            break
        }else{
            if tleft[0] < tright[0]{
                temp.append(tleft[0])
                tleft.removeAtIndex(0)
            }else{
                temp.append(tright[0])
                tright.removeAtIndex(0)
            }
        }
    }
    println(temp)
    return temp
}
println(mergeSort(randomNumbers))