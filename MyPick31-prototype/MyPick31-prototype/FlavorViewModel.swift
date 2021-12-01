//
//  ImageViewModel.swift
//  MyPick31-prototype
//
//  Created by Bibi on 2021/12/01.
//

import Foundation

// view model
class FlavorViewModel {
    
    var flavorList = Array<Flavor>()
        
        let fileManager = FileManager.default
        let flavorFilePath = "/Users/bibi/study/codesquad-cocoa-2021/MyPick31-prototype/MyPick31-prototype/data" // 상대경로로 넣는 법 찾아보기..
        let flavorFileName = "flavor-data.txt"
        
        func getFlavorWithId(id: Int) -> Flavor {
            // 각 아이스크림 정보 넣어주기
            return flavorList[id]
        }
        
        func setFlavorList() {
            let dataPathURL = URL(fileURLWithPath: flavorFilePath).appendingPathComponent(flavorFileName)
            var dataContent = ""
            do {
                dataContent = try String(contentsOf: dataPathURL, encoding: .utf8)
            } catch let e as NSError {
                print("ERROR : \(e)")
            }
            var dataArray = dataContent.components(separatedBy: ["/","\n"]).map{$0.trimmingCharacters(in: .whitespacesAndNewlines)}
            var flavor = Flavor()
            for i in 0..<dataArray.count {
                switch i % 8 {
                case 1:
                    flavor.nameKR = dataArray[i]
                case 2:
                    flavor.nameEN = dataArray[i]
                case 3:
                    flavor.base = dataArray[i]
                case 4:
                    flavor.topping = dataArray[i]
                case 5:
                    flavor.syrup = dataArray[i]
                case 6:
                    flavor.kcal = Int(dataArray[i]) ?? 0
                case 7:
                    flavor.allergen = dataArray[i]
                default: // case 0
                    flavor.id = Int(dataArray[i]) ?? 0
                }
                if i % 8 == 7 {
                    print(flavor.id, flavor.nameKR, flavor.nameEN, flavor.base, flavor.topping, flavor.syrup, flavor.kcal, flavor.allergen)
                    flavorList.append(flavor)
                    flavor = Flavor()
                }
            }
        }
        
        // MARK: - ImageViewModel
        
        let setImageInfoList: [FlavorImageInfo] = [
            FlavorImageInfo(nameKR: "바닐라", nameEN: "vanilla"),
            FlavorImageInfo(nameKR: "초콜릿", nameEN: "chocolate"),
            FlavorImageInfo(nameKR: "31요거트", nameEN: "31yogurt"),
            FlavorImageInfo(nameKR: "그린티", nameEN: "green tea"),
            FlavorImageInfo(nameKR: "레인보우 샤베트", nameEN: "rainbow sherbet"),
            FlavorImageInfo(nameKR: "체리쥬빌레", nameEN: "cherry jubille"),
            FlavorImageInfo(nameKR: "엄마는 외계인", nameEN: "Puss In Boots"),
            FlavorImageInfo(nameKR: "민트 초콜릿 칩", nameEN: "mint chocolate chip"),
            FlavorImageInfo(nameKR: "아몬드 봉봉", nameEN: "almond bon bon"),
            FlavorImageInfo(nameKR: "오레오 쿠키 앤 크림", nameEN: "Oreo cookies'n cream"),
            FlavorImageInfo(nameKR: "초콜릿 무스", nameEN: "chocolate mousse"),
            FlavorImageInfo(nameKR: "슈팅스타", nameEN: "shooting star"),
            FlavorImageInfo(nameKR: "뉴욕 치즈케이크", nameEN: "new york cheesecake"),
            FlavorImageInfo(nameKR: "이상한 나라의 솜사탕", nameEN: "cotton candy wonderland"),
            FlavorImageInfo(nameKR: "베리베리 스트로베리", nameEN: "very berry strawberry"),
            FlavorImageInfo(nameKR: "사랑에 빠진 딸기", nameEN: "love struck strawberry"),
            FlavorImageInfo(nameKR: "바람과 함께 사라지다", nameEN: "twinberry cheesecake"),
            FlavorImageInfo(nameKR: "피스타치오 아몬드", nameEN: "pistachio almond"),
            FlavorImageInfo(nameKR: "자모카 아몬드 훠지", nameEN: "jamoca almond fudge"),
            FlavorImageInfo(nameKR: "월넛", nameEN: "walnut")
        ]
        
        var countOfImageList: Int {
            return setImageInfoList.count
        }
        
        func imageInfo(at index: Int) -> FlavorImageInfo {
            return setImageInfoList[index]
        }
        
}
