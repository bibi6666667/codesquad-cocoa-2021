//
//  p3.swift
//  day11
//
//  Created by Bibi on 2021/11/15.
//

import Foundation

class BubbleSort {
    
    var intArray = Array<Int>()
    
    init(array: [Int]) {
        intArray = array
    }
    
    func sorted(isAscending: Bool) -> Array<Int> {
        
        var copyIntArray = intArray
        
        func swap(aIndex: Int, bIndex: Int) {
            let tempItem = copyIntArray[aIndex]
            copyIntArray[aIndex] = copyIntArray[bIndex]
            copyIntArray[bIndex] = tempItem
            
        }
        
        for i in 1...copyIntArray.count {
            for j in 0..<copyIntArray.count - 1 {
                print(copyIntArray[j], copyIntArray[j + 1])
                if isAscending {
                    if copyIntArray[j] > copyIntArray[j + 1] {
                        swap(aIndex: j, bIndex: j + 1)
                        print(copyIntArray)
                    }
                } else {
                    if copyIntArray[j] < copyIntArray[j + 1] {
                        swap(aIndex: j, bIndex: j + 1)
                        print(copyIntArray)
                    }
                }
                
            }
        }
        
        return copyIntArray
        
    }
}
