//
//  p1.swift
//  day18
//
//  Created by Bibi on 2021/11/24.
//

import Foundation

enum FilenameExtension: String {
    case md = "md"
    case swift = "swift"
    case txt = "txt"
    case jpg = "jpeg"
}

let fileManager = FileManager.default

func files(at path: String) -> Array<String> {
    var contents = Array<String>()
    do {
        contents = try fileManager.contentsOfDirectory(atPath: path)
    } catch let e as NSError {
        print("error : \(e)")
    }
    return contents
}

func isExist(filename: String, at path: String) -> Bool {
    var contents = Array<String>()
    do {
        contents = try fileManager.contentsOfDirectory(atPath: path)
    } catch let e as NSError {
        print("error : \(e)")
    }
    return contents.contains(filename) ? true : false
}

// 여러 파일 찾기 - 각 파일들 존재 여부를 배열로 반환
func isExist(filename: String..., at path: String) -> [Bool] {
    var boolArray = Array<Bool>()
    filename.forEach {
        let result = isExist(filename: $0, at: path)
        boolArray.append(result)
    }
    return boolArray
}

func sortNameAscending(files: [String]) -> [String] {
    return files.sorted()
}

// 확장자가 fileExtension인 파일 찾기
func findFiles(fileExtension: FilenameExtension, at path: String) -> [String] {
    var result = Array<String>()
    var files = files(at: path)
    result = files.filter {
        $0.contains(".") && $0.split(separator: ".")[1] == fileExtension.rawValue
    }
    return result
}


