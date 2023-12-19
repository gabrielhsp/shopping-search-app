//
//  UIView+Extension.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 19/12/23.
//

import UIKit

extension UIView {
    func setCornerRadius(radius: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
}
