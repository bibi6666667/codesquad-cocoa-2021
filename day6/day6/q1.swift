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
