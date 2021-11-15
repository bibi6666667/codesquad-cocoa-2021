//
//  p1.swift
//  day11
//
//  Created by Bibi on 2021/11/15.
//

import Foundation

// 연습 1 - 행렬 계산

class Matrix {
    var a : Double
    var b : Double
    var c : Double
    var d : Double
    
    init(a: Double = 0, b: Double = 0, c: Double = 0, d: Double = 0) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    func sum(with other: Matrix) -> Matrix {
        return Matrix(a: self.a + other.a,
                      b: self.b + other.b,
                      c: self.c + other.c,
                      d: self.d + other.d)
    }
    
    func product(with other: Matrix) -> Matrix {
        return Matrix(a: (self.a * other.a) + (self.b * other.c),
                      b: (self.a * other.b) + (self.b * other.d),
                      c: (self.c * other.a) + (self.d * other.c),
                      d: (self.c * other.b) + (self.d * other.d))
    }
}
