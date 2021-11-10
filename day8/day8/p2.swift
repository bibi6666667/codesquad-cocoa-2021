//
//  p2.swift
//  day8
//
//  Created by Bibi on 2021/11/10.
//

import Foundation

struct BaseBallGame {
    
    var randomInt = 0
    
    mutating func newGame() {
        randomInt = Int.random(in: 100...999)
    }
    
    func hit(num: Int) -> (strikeCount: Int, ballCount: Int) {
        var inputArr = Array<Int>(repeating: 0, count: 3)
        var randomArr = Array<Int>(repeating: 0, count: 3)
        for i in 0...2 {
            let currentDigit: Double = Double(3 - i)
            let inputNum = (num % Int(pow(10.0, currentDigit))) / Int(pow(10.0, currentDigit - 1))
            let randomNum = (randomInt % Int(pow(10.0, currentDigit))) / Int(pow(10.0, currentDigit - 1))
            inputArr[i] = inputNum
            randomArr[i] = randomNum
        }
        var strikeCount = 0
        var ballcount = 0
        for i in 0...randomArr.count - 1 {
            if randomArr[i] == inputArr[i]{
                strikeCount += 1
            } else if randomArr.contains(inputArr[i]) {
                
                ballcount += 1
            }
            
        }
        return (strikeCount, ballcount)
    }
    
    func showGameScore() -> Bool {
        print("숫자 야구 게임을 시작합니다.")
        for i in 1...9 {
            print("\(i) 번째 시도 : 3자리 숫자를 입력하세요")
            let inputNumString = readLine() ?? ""
            let inputNum = Int(inputNumString) ?? 0
            let oneTurn = hit(num: inputNum)
            print("현재 점수 : (\(oneTurn.strikeCount))스트라이크, (\(oneTurn.ballCount))볼")
            if oneTurn.strikeCount == 3 {
                print("정답입니다")
                return true
            }
        }
        return false
    }
}
