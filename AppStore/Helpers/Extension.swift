//
//  Extension.swift
//  AppStore
//
//  Created by Zahra Alizada on 20.09.24.
//

import UIKit

extension UIImageView {
    func customMode() {
        contentMode = .scaleAspectFill
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    
    func customScreenshot() {
        layer.cornerRadius = 12
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 0.85
    }
}

