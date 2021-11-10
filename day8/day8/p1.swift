//
//  p1.swift
//  day8
//
//  Created by Bibi on 2021/11/10.
//

import Foundation

struct InterestRateCalculator {

    let myMoney = 1000000
    
    func getInterestRate(byDay: Int) -> Double {
        switch byDay {
        case 91...180 :
            return 0.01
        case 181...364 :
            return 0.02
        case 365... :
            return 0.056
        default : // 90일 이하
            return 0.005
        }
    }
    
    func calculateAmount(day: Int, amount: Int) -> Double {
        let doubleAmount = Double(amount)
        return doubleAmount + (doubleAmount * getInterestRate(byDay: day))
    }
    
    func testInterest(unitDay: Int) -> Double {
        for day in 1...365 {
            if day % unitDay == 0 {
                print("\(day)일차 원금+이자 = \(calculateAmount(day: day, amount: myMoney))")
            }
        }
        return calculateAmount(day: 365, amount: myMoney)
    }
}
