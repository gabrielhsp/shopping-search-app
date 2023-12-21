//
//  ShoppingSearchProductsListPresenter.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import Foundation

final class ShoppingSearchProductsListPresenter {
    // MARK: - Properties
    private let searchResponse: ShoppingSearchModel
    weak var controller: ShoppingSearchProductsListViewControllerType?
    
    // MARK: - Initializer Methods
    init(searchResponse: ShoppingSearchModel) {
        self.searchResponse = searchResponse
    }
    
    // MARK: - Private Methods
    private func formatPrice(from price: Double?) -> String? {
        guard let price = price else { return nil }
        
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter.string(from: NSNumber(value: price))
    }
    
    private func createSearchProductListItem(product: ShoppingSearchProductModel) -> ShoppingSearchProductListItem {
        ShoppingSearchProductListItem(id: product.id,
                                      image: product.thumbnail,
                                      name: product.title,
                                      originalPrice: formatPrice(from: product.price),
                                      promotionalPrice: formatPrice(from: product.salePrice),
                                      isFreeDelivered: true,
                                      condition: .new)
    }
}

// MARK: - ShoppingProductsListPresenterType
extension ShoppingSearchProductsListPresenter: ShoppingSearchProductsListPresenterType {
    func getProductsList() {
        let items = searchResponse.results.map { createSearchProductListItem(product: $0) }
        let dataSource = ShoppingSearchProductsListDataSource(items: items)
        
        controller?.didRequestProductsSuccessfully(dataSource: dataSource)
    }
}
