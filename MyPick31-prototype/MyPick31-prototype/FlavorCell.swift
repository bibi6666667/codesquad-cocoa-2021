//
//  FlavorCell.swift
//  MyPick31-prototype
//
//  Created by Bibi on 2021/12/01.
//

import Foundation
import UIKit

class FlavorCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameKR: UILabel!
    @IBOutlet weak var nameEN: UILabel!
    @IBOutlet weak var signatureOrSeason: UILabel!
    @IBOutlet weak var onSaleOrNot: UILabel!
    
    func update(info: FlavorImageInfo) {
        image.image = info.image
        nameKR.text = info.nameKR
    }
}
