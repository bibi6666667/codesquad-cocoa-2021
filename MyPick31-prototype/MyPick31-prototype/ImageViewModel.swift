//
//  ImageViewModel.swift
//  MyPick31-prototype
//
//  Created by Bibi on 2021/12/01.
//

import Foundation

// view model
class ImageViewModel {
    let imageInfoList: [FlavorImageInfo] = [
        FlavorImageInfo(nameKR: "바닐라"),
        FlavorImageInfo(nameKR: "초콜릿"),
        FlavorImageInfo(nameKR: "31요거트"),
        FlavorImageInfo(nameKR: "그린티"),
        FlavorImageInfo(nameKR: "레인보우 샤베트"),
        FlavorImageInfo(nameKR: "체리쥬빌레"),
        FlavorImageInfo(nameKR: "엄마는 외계인"),
        FlavorImageInfo(nameKR: "민트 초콜릿 칩"),
        FlavorImageInfo(nameKR: "아몬드 봉봉"),
        FlavorImageInfo(nameKR: "오레오 쿠키 앤 크림"),
        FlavorImageInfo(nameKR: "초콜릿 무스"),
        FlavorImageInfo(nameKR: "슈팅스타"),
        FlavorImageInfo(nameKR: "뉴욕 치즈케이크"),
        FlavorImageInfo(nameKR: "이상한 나라의 솜사탕"),
        FlavorImageInfo(nameKR: "베리베리 스트로베리"),
        FlavorImageInfo(nameKR: "사랑에 빠진 딸기"),
        FlavorImageInfo(nameKR: "바람과 함께 사라지다"),
        FlavorImageInfo(nameKR: "피스타치오 아몬드"),
        FlavorImageInfo(nameKR: "자모카 아몬드 훠지"),
        FlavorImageInfo(nameKR: "월넛"),
        
    ]
    
    var countOfImageList: Int {
        return imageInfoList.count
    }
    
    func imageInfo(at index: Int) -> FlavorImageInfo {
        return imageInfoList[index]
    }
}
