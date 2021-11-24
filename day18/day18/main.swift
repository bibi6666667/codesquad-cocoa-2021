//
//  main.swift
//  day18
//
//  Created by Bibi on 2021/11/24.
//

import Foundation

let path = "/Users/bibi/test"
//let contents = files(at: path)
//print(contents)
//print(sortNameAscending(files: contents))
//print(isExist(filename: "abc", at: path))
//print(isExist(filename: "abc", "cocoa", "kakao", "baskin", "iOS", "xcode", at: path))
//print(findFiles(fileExtension: .txt, at: path))

let cocoaCsv = Csv(fileName: "cocoa.csv", at: path)
cocoaCsv.add(name: "bibi", email: "bibi6666667@kakao.com", language: "swift", grade: 10)
print(cocoaCsv.csvArray)
print(cocoaCsv.findBy(name: "bibi"))
print(cocoaCsv.removeBy(email: "bibi6666667@kakao.com"))
print(cocoaCsv.csvArray)
print(cocoaCsv.write(to: "new-csv-file.csv"))
