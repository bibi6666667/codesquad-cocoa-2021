//
//  q2.swift
//  day6
//
//  Created by Bibi on 2021/11/08.
//

import Foundation

// 연습문제 2 - 아이디 규칙 검사
// TODO : 연습문제 2, 3번은 정규표현식을 배운 뒤에 다시 풀어보겠습니다 :)..
func IDValidator(id: String) -> Bool {
    if id.count < 5 || id.count >= 24 {
        print("아이디가 5글자 미만 24글자 이상입니다")
    }
    return false
}
