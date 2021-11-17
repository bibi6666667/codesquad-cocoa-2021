//
//  floatingPoint.swift
//  day13
//
//  Created by Bibi on 2021/11/17.
//

import Foundation

func sum(value: Double, repeat: Int) -> Double {
    var sum : Double = 0
    for _ in 1...`repeat` {
        sum += value
    }
    return sum
}

