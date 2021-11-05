//
//  main.swift
//  LadderGame
//
//  Created by Bibi on 2021/11/04.
//

import Foundation

print("참여 인원 입력")
let input = readLine() ?? ""
ladderGame(input: Int(input) ?? 0)

func ladderGame(input: Int) {
    
    if input < 2 || input > 8 {
        printGameOver()
    } else {
        printLadder(array: makeLadder(peopleNum: input, ladderHeight: 4))
    }
    
    func printGameOver() {
        print("프로그램 종료")
    }
    
    func printLadder(array: Array<Array<String>>) {
        for innerArray in array { // 바깥쪽 배열
            for item in innerArray { // 안쪽 배열
                print(item, terminator: "")
            }
            print()
        }
    }
    
    func makeLadder(peopleNum: Int, ladderHeight: Int) -> Array<Array<String>> {
        var resultArray = Array<Array<String>>()
        for _ in 1...ladderHeight { // 세로
            var tempArray = Array<String>()
            for _ in 1...peopleNum-1 { // 가로
                tempArray.append("|")
                let randomInt = Int.random(in: 1...100)
                if randomInt % 2 == 0 {
                    tempArray.append("-")
                } else {
                    tempArray.append(" ")
                }
            }
            tempArray.append("|")
            resultArray.append(tempArray)
        }
        return resultArray
    }

}
