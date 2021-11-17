//
//  p1.swift
//  day13
//
//  Created by Bibi on 2021/11/17.
//

import Foundation

enum Bracket: String {
    case round = "()"
    case square = "[]"
    case curly = "{}"
}

struct BracketValidatior {
    var bracket: Bracket
    
    
    init(with: Bracket) {
        bracket = with
    }
    
    // 완성 못함 :)...
//    func generate(with count: Int) -> Array<String> {
//        
//        var bracketStack = Stack()
//        let bracketStr = bracket.rawValue
//        let openBracket = String(bracketStr[bracketStr.startIndex])
//        let closeIndex = bracketStr.index(before: bracketStr.endIndex)
//        let closeBracket = String(bracketStr[closeIndex])
//        
//    }
    
    func analyze(with value: String) -> Bool {
        var bracketStack = Array<String>()
        for char in value {
            print(char)
            switch char {
            case ")" :
                if bracketStack.last == "(" {
                    bracketStack.popLast()
                } else {
                    return false
                }
            case "}" :
                let lastBracket = bracketStack.last
                if lastBracket == "{" {
                    bracketStack.popLast()
                } else {
                    return false
                }
            case "]" :
                let lastBracket = bracketStack.last
                if lastBracket == "[" {
                    bracketStack.popLast()
                } else {
                    return false
                }
            default : // (, {, [ 인 경우
                bracketStack.append(String(char))
            }
            print(bracketStack)
        }
        return bracketStack.isEmpty
    }
}

class Stack {
    var stack = Array<String>() {
        didSet {
            stackPointer = stack.endIndex
        }
    }
    var stackPointer: Int
    
    init() {
        stackPointer = 0
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty ? true : false
    }
    
    func size() -> Int {
        return stack.count
    }
    
    func contains(item: String) -> Bool {
        return stack.contains(item)
    }
    
    func push(_ item: String) {
        stack.append(item)
    }
    
    func pop() -> String? {
        return stack.popLast()
    }
}
