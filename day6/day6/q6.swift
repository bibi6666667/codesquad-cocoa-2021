//
//  q6.swift
//  day6
//
//  Created by Bibi on 2021/11/08.
//

import Foundation

func duplicatedWords(inputWords: Array<String>) -> Array<String> {
    var words = Array<String>(inputWords)
    var result = Array<String>()
    for _ in 1...inputWords.count {
        let word = words.removeFirst()
        if words.contains(word) && !result.contains(word) {
            result.append(word)
        } else {
            continue
        }
    }
    return result
}
