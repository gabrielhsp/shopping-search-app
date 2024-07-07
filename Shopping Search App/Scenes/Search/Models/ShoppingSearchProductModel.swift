//
//  ShoppingSearchProductModel.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import Foundation

struct ShoppingSearchProductModel: Decodable, Equatable {
    let id: String
    let title: String
    let condition: String
    let thumbnail: String
    let price: Double
    let originalPrice: Double?
    let salePrice: SalePrice?
    let availableQuantity: Int
    let installments: Installments?
    let shipping: Shipping?
    
    struct Installments: Decodable, Equatable {
        let quantity: Int
        let amount: Double
        let rate: Double
        let currencyId: String
    }
    
    struct Shipping: Decodable, Equatable {
        let freeShipping: Bool
    }
    
    struct SalePrice: Decodable, Equatable {
        let amount: Double?
    }
}
