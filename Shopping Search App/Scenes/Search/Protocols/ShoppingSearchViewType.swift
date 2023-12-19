//
//  ShoppingSearchViewType.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 18/12/23.
//

import UIKit

protocol ShoppingSearchViewType where Self: UIView {
    var didTapSearchButton: ((String?) -> Void)? { get set }
}
