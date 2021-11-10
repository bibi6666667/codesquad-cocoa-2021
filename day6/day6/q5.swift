//
//  q5.swift
//  day6
//
//  Created by Bibi on 2021/11/08.
//

import Foundation

// 연습 5 - 개미 속 퍼즐
// 미완성
func antFunction(inputArray: Array<Int>) -> Array<Int> {
    let initValue = 1
    var currentArr = [initValue]
    var lastValue = 1
    var number = 0
    for i in 0...inputArray.count {
        if currentArr[i] == lastValue {
            number += 1
            currentArr.append(number)
        } else {
            currentArr.append(lastValue)
            currentArr.append(number)
        }
        lastValue = currentArr[i]
        print(currentArr)
    }
    return currentArr
}
