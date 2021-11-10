//
//  ViewController.swift
//  PasswordValidation
//
//  Created by Bibi on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var levelView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchEnterButton(_ sender: Any) {
            let securityLevel = passwordValidator(password: passwordInput.text ?? "")
        levelView.text = "\(securityLevel)단계"
        switch securityLevel {
        case 1:
            levelView.backgroundColor = UIColor.red
        case 2:
            levelView.backgroundColor = UIColor.orange
        case 4:
            levelView.backgroundColor = UIColor.blue
        case 5:
            levelView.backgroundColor = UIColor.green
        default:
            levelView.backgroundColor = UIColor.yellow
        }
    }
    
    func passwordValidator(password: String) -> Int {
        let passwordCharSet = CharacterSet(charactersIn: password)
        let passwordLength = password.count
//        숫자로만 구성되고 길이가 8글자 미만 : 아주 약한 암호(1 Level)
//        영문자로만 구성되고 길이가 8글자 미만 : 약한 암호 (2 Level)
//        영문자와 한 개 이상의 숫자로만 구성되어 있고 길이 8글자 이상 : 강한 암호 (4 Level)
//        영문자와 숫자, 특수문자(-, +, !, @, #, $, %)가 한 개 이상씩 구성되어 있고 길이가 8글자 이상 : 아주 강한 암호 (5 Level)
//        나머지 경우는 : 보통 암호 (3 Level)
        let numberSet = CharacterSet.decimalDigits
        let letterSet = CharacterSet.letters
        let alphanumericSet = CharacterSet.alphanumerics
        let specialLetterSet = CharacterSet(charactersIn: "-+!@#$%")  // CharacterSet.symbols ?
        if !numberSet.intersection(passwordCharSet).isEmpty && !letterSet.intersection(passwordCharSet).isEmpty && !specialLetterSet.intersection(passwordCharSet).isEmpty && passwordLength >= 8 {
            return 5
        }
        if !numberSet.intersection(passwordCharSet).isEmpty && !letterSet.intersection(passwordCharSet).isEmpty && passwordLength >= 8 {
            return 4
        }
        if passwordCharSet.isSubset(of: letterSet) && passwordLength < 8 {
            return 2
        }
        if passwordCharSet.isSubset(of: numberSet) && passwordLength < 8 {
            return 1
        }
        return 3
    }
    
}

