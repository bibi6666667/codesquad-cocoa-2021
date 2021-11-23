//
//  ViewController.swift
//  HanguelClock
//
//  Created by Bibi on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var 오_전후: UILabel!
    @IBOutlet weak var 전: UILabel!
    @IBOutlet weak var 후: UILabel!
    @IBOutlet weak var 영: UILabel!
    @IBOutlet weak var 열: UILabel!
    @IBOutlet weak var 한: UILabel!
    @IBOutlet weak var 두: UILabel!
    @IBOutlet weak var 세: UILabel!
    @IBOutlet weak var 네: UILabel!
    @IBOutlet weak var 다: UILabel!
    @IBOutlet weak var 여_섯: UILabel!
    @IBOutlet weak var 섯: UILabel!
    @IBOutlet weak var 일_곱: UILabel!
    @IBOutlet weak var 곱: UILabel!
    @IBOutlet weak var 여_덟: UILabel!
    @IBOutlet weak var 덟: UILabel!
    @IBOutlet weak var 아: UILabel!
    @IBOutlet weak var 홉: UILabel!
    @IBOutlet weak var 시: UILabel!
    @IBOutlet weak var 해달: UILabel!
    @IBOutlet weak var 이_십: UILabel!
    @IBOutlet weak var 삼_십: UILabel!
    @IBOutlet weak var 사_십: UILabel!
    @IBOutlet weak var 오_십: UILabel!
    @IBOutlet weak var 십: UILabel!
    @IBOutlet weak var 일: UILabel!
    @IBOutlet weak var 이: UILabel!
    @IBOutlet weak var 삼: UILabel!
    @IBOutlet weak var 사: UILabel!
    @IBOutlet weak var 오: UILabel!
    @IBOutlet weak var 육: UILabel!
    @IBOutlet weak var 칠: UILabel!
    @IBOutlet weak var 팔: UILabel!
    @IBOutlet weak var 구: UILabel!
    @IBOutlet weak var 분: UILabel!
    @IBOutlet weak var 초_십의자리: UILabel!
    @IBOutlet weak var 초_일의자리: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer()
        // Do any additional setup after loading the view.
    }
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            (timer) in
            let currentDate = Date()
            let calendar =  NSCalendar.current
            print("\(calendar.component(.hour, from: currentDate)):\(calendar.component(.minute, from: currentDate)):\(calendar.component(.second, from: currentDate))")
            
            self.setSecondBaseColor()
            self.setHourMinuteBaseColor()
            self.setClock(date: currentDate, calendar: calendar)
        }
    }
    
    func setClock(date: Date, calendar: Calendar) {
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        if hour >= 12 { // 오후
            오_전후.textColor = UIColor.systemBlue
            후.textColor = UIColor.systemBlue
        } else { // 오전
            오_전후.textColor = UIColor.systemBlue
            전.textColor = UIColor.systemBlue
        }
        if hour >= 7 && hour < 19 { // 해/달
            해달.text = "☀️"
        } else {
            해달.text = "🌙"
        }
        setClockHour(hour: hour)
        setClockMinute(minute: minute)
        setClockSecond(second: second)
        
    }
    
    func setClockHour(hour: Int) {
        // 시 - 24시간제
        switch hour {
        case 1, 13:
            한.textColor = UIColor.systemBlue
        case 2, 14:
            두.textColor = UIColor.systemBlue
        case 3, 15:
            세.textColor = UIColor.systemBlue
        case 4, 16:
            네.textColor = UIColor.systemBlue
        case 5, 17:
            다.textColor = UIColor.systemBlue
            섯.textColor = UIColor.systemBlue
        case 6, 18:
            여_섯.textColor = UIColor.systemBlue
            섯.textColor = UIColor.systemBlue
        case 7, 19:
            일_곱.textColor = UIColor.systemBlue
            곱.textColor = UIColor.systemBlue
        case 8, 20:
            여_덟.textColor = UIColor.systemBlue
            덟.textColor = UIColor.systemBlue
        case 9, 21:
            아.textColor = UIColor.systemBlue
            홉.textColor = UIColor.systemBlue
        case 10, 22:
            열.textColor = UIColor.systemBlue
        case 11, 23:
            열.textColor = UIColor.systemBlue
            한.textColor = UIColor.systemBlue
        case 12, 24:
            열.textColor = UIColor.systemBlue
            두.textColor = UIColor.systemBlue
        default:
            영.textColor = UIColor.systemBlue // ?? 쓸 일이 없음..
        }
        시.textColor = UIColor.systemBlue
    }
    
    func setClockMinute(minute: Int) {
        switch minute { // 십의 자리
        case 50... :
            오_십.textColor = UIColor.systemBlue
        case 40..<50 :
            사_십.textColor = UIColor.systemBlue
        case 30..<40 :
            삼_십.textColor = UIColor.systemBlue
        case 20..<30 :
            이_십.textColor = UIColor.systemBlue
        case 10..<20 :
            십.textColor = UIColor.systemBlue
        default : // 0~9분
            십.textColor = UIColor.systemGray
        }
        switch minute % 10 { // 일의 자리
        case 1 :
            일.textColor = UIColor.systemBlue
        case 2 :
            이.textColor = UIColor.systemBlue
        case 3 :
            삼.textColor = UIColor.systemBlue
        case 4 :
            사.textColor = UIColor.systemBlue
        case 5 :
            오.textColor = UIColor.systemBlue
        case 6 :
            육.textColor = UIColor.systemBlue
        case 7 :
            칠.textColor = UIColor.systemBlue
        case 8 :
            팔.textColor = UIColor.systemBlue
        case 9 :
            구.textColor = UIColor.systemBlue
        default:
            분.textColor = UIColor.systemBlue
        }
        if minute != 0 {
            분.textColor = UIColor.systemBlue
        }
    }
    
    func setClockSecond(second: Int) {
        switch second { // 초 십의자리
        case 50... :
            초_십의자리.text = "오십"
        case 40..<50 :
            초_십의자리.text = "사십"
        case 30..<40 :
            초_십의자리.text = "삼십"
        case 20..<30 :
            초_십의자리.text = "이십"
        case 10..<20 :
            초_십의자리.text = "십"
        default : // 0~9초
            초_십의자리.text = ""
        }
        switch second % 10 { // 초 일의 자리
        case 1 :
            초_일의자리.text = "일초"
        case 2 :
            초_일의자리.text = "이초"
        case 3 :
            초_일의자리.text = "삼초"
        case 4 :
            초_일의자리.text = "사초"
        case 5 :
            초_일의자리.text = "오초"
        case 6 :
            초_일의자리.text = "육초"
        case 7 :
            초_일의자리.text = "칠초"
        case 8 :
            초_일의자리.text = "팔초"
        case 9 :
            초_일의자리.text = "구초 \n"
        default:
            초_일의자리.text = "초"
        }
        if second == 0 {
            초_십의자리.text = ""
            초_일의자리.text = "정각"
            초_일의자리.textColor = UIColor.systemBlue
        } else {
            초_십의자리.textColor = UIColor.systemBlue
            초_일의자리.textColor = UIColor.systemBlue
        }
    }
    
    func setHourMinuteBaseColor() {
        self.오_전후.textColor = UIColor.systemGray
        self.전.textColor = UIColor.systemGray
        self.후.textColor = UIColor.systemGray
        self.영.textColor = UIColor.systemGray
        self.열.textColor = UIColor.systemGray
        self.한.textColor = UIColor.systemGray
        self.두.textColor = UIColor.systemGray
        self.세.textColor = UIColor.systemGray
        self.네.textColor = UIColor.systemGray
        self.다.textColor = UIColor.systemGray
        self.여_섯.textColor = UIColor.systemGray
        self.섯.textColor = UIColor.systemGray
        self.일_곱.textColor = UIColor.systemGray
        self.곱.textColor = UIColor.systemGray
        self.여_덟.textColor = UIColor.systemGray
        self.덟.textColor = UIColor.systemGray
        self.아.textColor = UIColor.systemGray
        self.홉.textColor = UIColor.systemGray
        self.시.textColor = UIColor.systemGray
        self.이_십.textColor = UIColor.systemGray
        self.삼_십.textColor = UIColor.systemGray
        self.사_십.textColor = UIColor.systemGray
        self.오_십.textColor = UIColor.systemGray
        self.십.textColor = UIColor.systemGray
        self.일.textColor = UIColor.systemGray
        self.이.textColor = UIColor.systemGray
        self.삼.textColor = UIColor.systemGray
        self.사.textColor = UIColor.systemGray
        self.오.textColor = UIColor.systemGray
        self.육.textColor = UIColor.systemGray
        self.칠.textColor = UIColor.systemGray
        self.팔.textColor = UIColor.systemGray
        self.구.textColor = UIColor.systemGray
        self.분.textColor = UIColor.systemGray
    }
    
    func setSecondBaseColor() {
        self.초_십의자리.textColor = UIColor.systemGray
        self.초_일의자리.textColor = UIColor.systemGray
    }


}

