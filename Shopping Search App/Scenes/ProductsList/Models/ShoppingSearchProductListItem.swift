//
//  ShoppingSearchProductListItem.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import Foundation

struct ShoppingSearchProductListItem: Equatable {
    let id: String
    let image: String
    let name: String
    let originalPrice: String?
    let promotionalPrice: String?
    let isFreeDelivered: Bool
    let condition: Condition
    
    enum Condition: String, Equatable {
        case new
        case used
    }
}
