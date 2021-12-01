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
    
    func updateImage(info: FlavorImageInfo) {
        image.image = info.image
        nameKR.text = info.nameKR
        nameEN.text = info.nameEN
    }
}
