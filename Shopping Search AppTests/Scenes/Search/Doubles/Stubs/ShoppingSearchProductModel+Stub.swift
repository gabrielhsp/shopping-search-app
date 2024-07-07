//
//  ShoppingSearchProductModel+Stub.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation
@testable import Shopping_Search_App

extension ShoppingSearchProductModel {
    static func stub(id: String = UUID().uuidString,
                     title: String = "iPhone 14 Pro Max",
                     condition: String = "new",
                     thumbnail: String = "iphone-14.jpg",
                     price: Double = 7200.10,
                     originalPrice: Double? = 7200.10,
                     salePrice: SalePrice? = .stub(),
                     availableQuantity: Int = 100,
                     installments: Installments? = .stub(),
                     shipping: Shipping? = .stub()) -> Self {
        ShoppingSearchProductModel(id: id,
                                   title: title,
                                   condition: condition,
                                   thumbnail: thumbnail,
                                   price: price,
                                   originalPrice: originalPrice,
                                   salePrice: salePrice,
                                   availableQuantity: availableQuantity, 
                                   installments: installments,
                                   shipping: shipping)
    }
    
    static func stubList() -> [Self] {
        return [
            .stub(),
            
            .stub(condition: "used",
                  salePrice: nil,
                  installments: .stub(quantity: 12, rate: 16.39),
                  shipping: .stub(freeShipping: false)),
            
            .stub(condition: "reuse",
                  salePrice: nil,
                  installments: nil,
                  shipping: nil)
        ]
    }
}

extension ShoppingSearchProductModel.Installments {
    static func stub(quantity: Int = 10,
                     amount: Double = 720.10,
                     rate: Double = 0,
                     currencyId: String = "BRL") -> Self {
        ShoppingSearchProductModel.Installments(quantity: quantity,
                                                amount: amount,
                                                rate: rate,
                                                currencyId: currencyId)
    }
}

extension ShoppingSearchProductModel.Shipping {
    static func stub(freeShipping: Bool = true) -> Self {
        ShoppingSearchProductModel.Shipping(freeShipping: freeShipping)
    }
}

extension ShoppingSearchProductModel.SalePrice {
    static func stub(amount: Double? = 6200.10) -> Self {
        ShoppingSearchProductModel.SalePrice(amount: amount)
    }
}
