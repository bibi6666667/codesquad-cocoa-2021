//
//  DetailViewController.swift
//  MyPick31-prototype
//
//  Created by Bibi on 2021/12/01.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameKR: UILabel!
    @IBOutlet weak var nameEN: UILabel!
    @IBOutlet weak var base: UILabel!
    @IBOutlet weak var topping: UILabel!
    @IBOutlet weak var syrup: UILabel!
    @IBOutlet weak var kcal: UILabel!
    @IBOutlet weak var allergen: UILabel!
    
    var currentFlavor: Flavor = Flavor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentFlavorData(flavor: currentFlavor)
        // Do any additional setup after loading the view.
    }
    
    func setCurrentFlavorData(flavor: Flavor) {
        currentFlavor = flavor
    }
    
    func setCurrentFlavorImage() {
        
    }
    
    // DetailViewController 준비할 때? flavor 넣어주기
    func showCurrentFlavorData(flavor: Flavor) {
        nameKR.text = flavor.nameKR
        nameEN.text = flavor.nameEN
        base.text = "베이스 : \(flavor.base)"
        topping.text = "토핑 : \(flavor.topping)"
        syrup.text = "시럽 : \(flavor.syrup)"
        kcal.text = "\(flavor.kcal)kcal"
        allergen.text = "알레르기 성분 : \(flavor.allergen)"
    }
    
    

    // MARK: - Navigation

    

}
