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
        didSet(oldValue) {
            if waitingNumber == 0 {
                waitButton.isEnabled = true
                doneButton.isEnabled = false
            }
            if waitingNumber > 0 && waitingNumber < 20 {
                waitingProgressBar.progressTintColor = UIColor.systemGray
                waitingProgressBar.progress = (Float(waitingNumber) / 20)
                waitButton.isEnabled = true
                doneButton.isEnabled = true
            }
            if waitingNumber == 20 {
                waitingProgressBar.progressTintColor = UIColor.systemRed
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
        if waitingNumber >= 1 {
            doneButton.isEnabled = true
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func wait(_ sender: Any) {
        waitingNumber += 1
        waitingNumberLabel.text = "\(waitingNumber)명"
    }
    
    @IBAction func done(_ sender: Any) {
        waitingNumber -= 1
        waitingNumberLabel.text = "\(waitingNumber)명"
    }
    
}

