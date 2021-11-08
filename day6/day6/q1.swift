//
//  q1.swift
//  day6
//
//  Created by Bibi on 2021/11/08.
//

import Foundation

// 연습문제 1 - 배열

// 미션 1 - 2차원배열
struct ArrayPractice {
    
    let num = 5
    
    func printArray(array: Array<Array<Int>>) {
        for innerArray in array {
            print(innerArray)
        }
    }
    
    func fillArray() -> Array<Array<Int>> {
        var result = Array<Array<Int>>()
        var currentNum = 1
        for i in 1...num * num {
            var tempArr = Array<Int>()
            if i % 5 == 1 {
                for j in 1...currentNum {
                    let appendNum = i + j - 1
                    tempArr.append(appendNum)
                }
                result.append(tempArr)
                currentNum += 1
            } else {
                continue
            }
        }
        return result
    }
}

// 미션 2 - setBoolArray, printArray
struct BoolArray {
    
    let num = 7
    
    func printArray(array: Array<Array<Bool>>, newChar: Character) {
        for innerArray in array {
            for item in innerArray {
                if item {
                    print(newChar, terminator: "")
                } else {
                    print(" ", terminator: "")
                }
            }
            print()
        }
    }
    
    func setBoolArray() -> Array<Array<Bool>> {
        var resultArray = Array<Array<Bool>>()
        for i in 1...num {
            var tempArray = Array<Bool>()
            if i == num {
                tempArray = Array<Bool>(repeating: true, count: num)
            } else {
                for _ in 1...(num - i) {
                    tempArray.append(false)
                }
                for _ in 1...i {
                    tempArray.append(true)
                }
            }
            
            resultArray.append(tempArray)
        }
        return resultArray
    }
}
