//
//  ShoppingSearchProductListItem.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import Foundation

struct ShoppingSearchProductListItem: Equatable {
    let id: String
    let image: URL?
    let name: String
    let originalPrice: String?
    let promotionalPrice: String?
    let installments: NSAttributedString?
    let isFreeDelivered: Bool
    let condition: String?
    
    enum Condition: String, Equatable {
        case new
        case used
        
        var description: String {
            switch self {
            case .new:
                return "Produto novo"
            case .used:
                return "Produto usado"
            }
        }
    }
}
