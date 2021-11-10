//
//  ViewController.swift
//  Measurement
//
//  Created by Bibi on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func convertButtonTouched(_ sender: Any) {
        if let inputText = inputTextField.text {
            let inputDouble = Double(inputText) ?? 0
            let inputMeasure = Measurement(value: inputDouble, unit: UnitVolume.milliliters)
            let milliliterToOz = inputMeasure.converted(to: UnitVolume.fluidOunces)
            outputLabel.text = "\(milliliterToOz)"
        } else {
            outputLabel.text = "입력값이 없습니다"
        }
    }
}


