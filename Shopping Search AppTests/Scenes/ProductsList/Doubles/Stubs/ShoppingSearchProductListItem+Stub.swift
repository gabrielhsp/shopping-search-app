//
//  ShoppingSearchProductListItem+Stub.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import UIKit
@testable import Shopping_Search_App

extension ShoppingSearchProductListItem {
    static func stub(id: String = UUID().uuidString,
                     image: URL? = URL(string: "http://http2.mlstatic.com/D_769598-MLB73014420871_112023-I.jpg"),
                     name: String = "iPhone 14 Pro Max",
                     originalPrice: String? = "R$ 7.900,00",
                     promotionalPrice: String? = "R$ 6.900,00",
                     installments: NSAttributedString? = NSAttributedString(string: "em até 10x sem juros"),
                     isFreeDelivered: Bool = true,
                     condition: String? = "Produto novo") -> Self {
        ShoppingSearchProductListItem(id: id,
                                      image: image,
                                      name: name,
                                      originalPrice: originalPrice,
                                      promotionalPrice: promotionalPrice,
                                      installments: installments,
                                      isFreeDelivered: isFreeDelivered,
                                      condition: condition)
    }
}
