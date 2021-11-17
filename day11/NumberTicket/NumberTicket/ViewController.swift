//
//  ViewController.swift
//  NumberTicket
//
//  Created by Bibi on 2021/11/15.
//

import UIKit

// 미완성!!
class ViewController: UIViewController {

    var waitingNumber: Int = 0 {
        didSet { // 프로퍼티 감시자
            waitingNumberLabel.text = "\(waitingNumber)명"
            
            switch waitingNumber {
            case 0 :
                waitingProgressBar.progress = 0.0
                waitButton.isEnabled = true
                doneButton.isEnabled = false
            case 1...19 :
                waitingProgressBar.progressTintColor = UIColor.systemBlue
                waitingProgressBar.setProgress(Float(waitingNumber) / 20.0, animated: true) // 이게 더 좋다.
                waitButton.isEnabled = true
                doneButton.isEnabled = true
            case 20 :
                waitingProgressBar.setProgress(1.0, animated: false)
                waitingProgressBar.progressTintColor = UIColor.systemRed
                waitButton.isEnabled = false
                doneButton.isEnabled = true
            default :
                waitButton.isEnabled = false
                doneButton.isEnabled = true
            }
        }
    }
    
    @IBOutlet weak var waitingNumberLabel: UILabel!
    @IBOutlet weak var waitingProgressBar: UIProgressView!
    @IBOutlet weak var waitButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    @IBAction func wait(_ sender: Any) {
        waitingNumber += 1
    }
    
    @IBAction func done(_ sender: Any) {
        waitingNumber -= 1
    }
    
}

