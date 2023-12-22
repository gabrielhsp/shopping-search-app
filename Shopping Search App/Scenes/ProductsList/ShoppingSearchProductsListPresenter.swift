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
        
        numberFormatter.locale = Locale(identifier: "pt_BR")
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter.string(from: NSNumber(value: price))
    }
    
    private func getProductCondition(condition: String) -> ShoppingSearchProductListItem.Condition {
        return ShoppingSearchProductListItem.Condition(rawValue: condition) ?? .new
    }
    
    private func createSearchProductListItem(product: ShoppingSearchProductModel) -> ShoppingSearchProductListItem {
        ShoppingSearchProductListItem(id: product.id,
                                      image: product.thumbnail,
                                      name: product.title,
                                      originalPrice: formatPrice(from: product.price),
                                      promotionalPrice: formatPrice(from: product.salePrice),
                                      installments: formatPrice(from: product.installments?.amount),
                                      isFreeDelivered: true,
                                      condition: getProductCondition(condition: product.condition))
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
