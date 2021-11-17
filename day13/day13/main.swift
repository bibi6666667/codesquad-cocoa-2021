//
//  main.swift
//  day13
//
//  Created by Bibi on 2021/11/17.
//

import Foundation

// 연습 1. 괄호쌍 맞추기 구조체
var bracketValidator = BracketValidatior(with: .round)
print(bracketValidator.analyze(with: "[{()}[]]"))

// 실습 - 부동소숫점 계산
print(sum(value: 0.001, repeat: 1000))
