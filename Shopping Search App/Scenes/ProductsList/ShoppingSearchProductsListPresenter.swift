//
//  ShoppingSearchProductsListPresenter.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import Foundation

final class ShoppingSearchProductsListPresenter {
    private let searchResponse: ShoppingSearchModel
    
    // MARK: - Initializer Methods
    init(searchResponse: ShoppingSearchModel) {
        self.searchResponse = searchResponse
    }
}

// MARK: - ShoppingProductsListPresenterType
extension ShoppingSearchProductsListPresenter: ShoppingSearchProductsListPresenterType {
    
}
