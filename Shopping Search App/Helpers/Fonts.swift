//
//  Fonts.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 22/12/23.
//

import UIKit

enum Fonts: CGFloat, Equatable {
    /// Returns 12
    case extraSmall = 12
    
    /// Returns 14
    case small = 14
    
    /// Returns 16
    case medium = 16
    
    /// Returns 18
    case large = 18
    
    func applyFont(weight: UIFont.Weight) -> UIFont {
        return .systemFont(ofSize: rawValue, weight: weight)
    }
}
