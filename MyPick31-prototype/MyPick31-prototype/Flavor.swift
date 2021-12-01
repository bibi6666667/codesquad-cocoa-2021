//
//  Flavor.swift
//  MyPick31-prototype
//
//  Created by Bibi on 2021/11/29.
//

import Foundation

class Flavor {
    
    var id: Int
    var nameKR: String
    var nameEN: String
    var base: String
    var topping: String
    var syrup: String
    var kcal: Int
    var allergen: String
    
    init() {
        self.id = 0
        self.nameKR = ""
        self.nameEN = ""
        self.base = ""
        self.topping = ""
        self.syrup = ""
        self.kcal = 0
        self.allergen = ""
    }
    
    init(id: Int, nameKR: String, nameEN: String, base: String, topping: String, syrup: String, kcal: Int, allergen: String) {
        self.id = id
        self.nameKR = nameKR
        self.nameEN = nameEN
        self.base = base
        self.topping = topping
        self.syrup = syrup
        self.kcal = kcal
        self.allergen = allergen
    }
    
}
