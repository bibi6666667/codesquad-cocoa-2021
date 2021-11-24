//
//  main.swift
//  day18
//
//  Created by Bibi on 2021/11/24.
//

import Foundation

let path = "/Users/bibi/test"
let contents = files(at: path)
print(contents)
print(sortNameAscending(files: contents))
print(isExist(filename: "abc", at: path))
print(isExist(filename: "abc", "cocoa", "kakao", "baskin", "iOS", "xcode", at: path))
print(findFiles(fileExtension: .txt, at: path))

