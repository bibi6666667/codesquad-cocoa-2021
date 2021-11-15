//
//  p2.swift
//  day11
//
//  Created by Bibi on 2021/11/15.
//

import Foundation

struct BinaryNumber {
    private var values = Array<String>()
    
    var count: Int
    
    init(with total: Int) {
        let maxNum: Int = Int(pow(2.0, Double(total)) - 1)
    
        for i in 0...maxNum {
            let binaryString = String(i, radix: 2)
            values.append(binaryString)
        }
        count = values.count
    }
    
    func find(by bitcount: Int) -> Array<String> {
        var result = Array<String>()
        for i in 0...count - 1 {
            var count1 = 0
            
            for char in values[i] {
                if char == "1" {
                    count1 += 1
                }
            }
            
            if count1 == bitcount {
                result.append(values[i])
            }
        }
        return result
    }
    
    
}
