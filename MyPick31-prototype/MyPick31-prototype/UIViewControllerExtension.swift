//
//  UIViewControllerExtension.swift
//  MyPick31-prototype
//
//  Created by Bibi on 2021/12/01.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
