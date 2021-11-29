//
//  Flavor.swift
//  MyPick31-prototype
//
//  Created by Bibi on 2021/11/29.
//

import Foundation

class Flavor {
    
    let id: Int
    let nameKR: String
    let nameEN: String
    let base: String
    let topping: String
    let syrup: String
    let image: String
    
    init(id: Int, nameKR: String, nameEN: String, base: String, topping: String, syrup: String, image: String) {
        self.id = id
        self.nameKR = nameKR
        self.nameEN = nameEN
        self.base = base
        self.topping = topping
        self.syrup = syrup
        self.image = image
    }
    
}
