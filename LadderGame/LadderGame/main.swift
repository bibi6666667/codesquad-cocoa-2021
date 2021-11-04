//
//  main.swift
//  LadderGame
//
//  Created by Bibi on 2021/11/04.
//

import Foundation

print("입력")
let input = readLine() ?? ""
ladderGame(input: Int(input) ?? 0)

func ladderGame(input: Int) {
    func gameOver() {
        print("프로그램 종료")
    }
    
    if input < 2 || input > 8 {
        gameOver()
    }
}
