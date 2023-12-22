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
                     salePrice: Double? = 6200.10,
                     availableQuantity: Int = 100,
                     installments: Installments = .stub()) -> Self {
        ShoppingSearchProductModel(id: id,
                                   title: title,
                                   condition: condition,
                                   thumbnail: thumbnail,
                                   price: price,
                                   originalPrice: originalPrice,
                                   salePrice: salePrice,
                                   availableQuantity: availableQuantity, 
                                   installments: installments)
    }
}

extension ShoppingSearchProductModel.Installments {
    static func stub() -> Self {
        ShoppingSearchProductModel.Installments(quantity: 10,
                                                amount: 720.10,
                                                rate: 0,
                                                currencyId: "BRL")
    }
}
