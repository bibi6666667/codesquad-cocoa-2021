//
//  p2.swift
//  day18
//
//  Created by Bibi on 2021/11/24.
//

import Foundation




class Csv {
    var keyName = ""
    var keyEmail = ""
    var keyLanguage = ""
    var keyGrade = ""
    var csvPath: URL
    
    var csvArray = Array<Dictionary<String, Any>>()
    
    init(fileName: String, at path: String) {
//        let userDirectory = fileManager.urls(for: .userDirectory, in: .allDomainsMask).first ?? URL(fileURLWithPath: "")
        let home = URL(fileURLWithPath: path)
        print("home : \(home)")
        csvPath = home
        let dataFile = home.appendingPathComponent(fileName)
        print("dataFile = \(dataFile)")
        var content = ""
        do {
            content = try String(contentsOf: dataFile, encoding: .utf8)
        } catch let e as NSError {
            print("error : \(e)")
        }
    
        var contentArr = content.components(separatedBy: [",", "\n"])
        var trimmedContentArr = contentArr.map {
            $0.trimmingCharacters(in: .whitespaces)
        }
        
        var columnNum = content.components(separatedBy: "\n")[0].components(separatedBy: ",").count
        
        var itemDictionary = Dictionary<String, Any>() // name, email, language, grade가 순서 없이 저장됨
        
        for i in 0..<trimmedContentArr.count {
            switch i {
            case 0 :
                keyName = trimmedContentArr[i]
                continue
            case 1 :
                keyEmail = trimmedContentArr[i]
                continue
            case 2 :
                keyLanguage = trimmedContentArr[i]
                continue
            case 3 :
                keyGrade = trimmedContentArr[i]
                continue
            default :
                if i % columnNum == 0 {
                    itemDictionary[keyName] = trimmedContentArr[i]
                }
                if i % columnNum == 1 {
                    itemDictionary[keyEmail] = trimmedContentArr[i]
                }
                if i % columnNum == 2 {
                    itemDictionary[keyLanguage] = trimmedContentArr[i]
                }
                if i % columnNum == 3 {
                    itemDictionary[keyGrade] = trimmedContentArr[i]
                }
                
            }
            if i % columnNum == 3 {
                csvArray.append(itemDictionary)
                itemDictionary = Dictionary<String, Any>()
            }
        }
    }
    
    func add(name: String, email: String, language: String, grade: Int) {
        var aDictionary = Dictionary<String, Any>()
        aDictionary[keyName] = name
        aDictionary[keyEmail] = email
        aDictionary[keyLanguage] = language
        aDictionary[keyGrade] = grade
        csvArray.append(aDictionary)
    }
    
    func findBy(name: String) -> Dictionary<String, Any> {
        var result = Dictionary<String, Any>()
        for i in 0..<csvArray.count {
            var aDictionary = csvArray[i]
            let nameValue = aDictionary[keyName]
            // as! ??
            if nameValue as! String == name {
                result = aDictionary
            }
        }
        return result
    }
    
    func removeBy(email: String) -> Bool {
        for i in 0..<csvArray.count {
            var aDictionary = csvArray[i]
            let emailValue = aDictionary[keyEmail]
            if emailValue as! String == email {
                csvArray.remove(at: i)
                return true
            }
        }
        return false
    }
    
    func write(to file: String) -> Bool {
        do {
            let contents = try fileManager.contentsOfDirectory(atPath: path)
            if contents.contains(file) {
                return false
            }
        } catch let error as NSError {
            print("Error access directory: \(error)")
        }
        
        let filePath = csvPath.appendingPathComponent(file)
        var content = ""
        for i in 0..<csvArray.count {
            content += "\(csvArray[i])"
            content += "\n"
        }
        print(content)
        do {
            try content.write(to: filePath, atomically: false, encoding: .utf8)
            return true
        } catch let e as NSError {
            print("error : \(e)")
            return false
        }
    }
}
