//
//  q4.swift
//  day6
//
//  Created by Bibi on 2021/11/08.
//

import Foundation

func residentRegistrationNumberValidityCheck(rrnumber: String) -> Bool {
    var splitArray = [Character]()
    for i in 0..<rrnumber.count {
        splitArray.append(rrnumber[rrnumber.index(rrnumber.startIndex, offsetBy: i)])
    }
    var splitIntArray: [Int] = splitArray.map{ Int(String($0)) ?? 0 }
    let calculatedNumberArray: [Int] = [splitIntArray[0] * 2,
                                        splitIntArray[1] * 3,
                                        splitIntArray[2] * 4,
                                        splitIntArray[3] * 5,
                                        splitIntArray[4] * 6,
                                        splitIntArray[5] * 7,
                                        splitIntArray[6] * 8,
                                        splitIntArray[7] * 9,
                                        splitIntArray[8] * 2,
                                        splitIntArray[9] * 3,
                                        splitIntArray[10] * 4,
                                        splitIntArray[11] * 5]
    let sum =  calculatedNumberArray.reduce(0, {$0 + $1})
    let remain = sum % 11
    let result = (11 - remain) % 10
    if result == splitIntArray[12] {
        return true
    }
    return false
}
