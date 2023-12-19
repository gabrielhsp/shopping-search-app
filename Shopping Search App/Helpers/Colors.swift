//
//  Colors.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 19/12/23.
//

import UIKit

enum Colors: String {
    case action
    case background
    case text
    case textFieldBackground
    case textFieldPlaceholder
    case textFieldValue
    case title
}

extension UIColor {
    static func appColor(_ color: Colors) -> UIColor? {
        return UIColor(named: color.rawValue)
    }
}
