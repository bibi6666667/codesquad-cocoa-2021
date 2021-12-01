//
//  FlavorImageInfo.swift
//  MyPick31-prototype
//
//  Created by Bibi on 2021/12/01.
//

import Foundation
import UIKit

struct FlavorImageInfo {
    let nameKR: String
    
    var image: UIImage? {
    return self.resizeImage(image: UIImage(named: "\(nameKR)")!, targetSize: CGSize(width: 170.0, height: 170.0)) // Assets에 있는 이미지 이름 지정해 불러오기.
    }
    
    init(nameKR: String) {
        self.nameKR = nameKR
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? { // 이미지 크기를 조정해 주는 함수?
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0) // 스위프트 자체 API 사용
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}
