//
//  main.swift
//  day11
//
//  Created by Bibi on 2021/11/15.
//

import Foundation

// 연습 1 행렬의 덧셈, 곱셈
//let matrix1234 = Matrix(a: 1.0, b: 2.0, c: 3.0, d: 4.0)
//let matrix78910 = Matrix(a: 7.0, b: 8.0, c: 9.0, d: 10.0)
//let result = matrix1234.sum(with: matrix78910)
//print(result.a, result.b, result.c, result.d)

// 연습 2 특별한 이진수 - 출력 형태가 조금 다릅니다:(
let binaryNumber = BinaryNumber.init(with: 5)
print(binaryNumber.find(by: 3))
