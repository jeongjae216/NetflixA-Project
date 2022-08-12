//
//  UIView+Border.swift
//  NetflixA
//
//  Created by 정재 on 2022/02/10.
//

import UIKit


extension UIView {
    
    func border(width: CGFloat = 1, color: UIColor = .black, radius: CGFloat = 0) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = radius
    }
    
}
