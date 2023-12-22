//
//  ShoppingSearchProductsListPresenter.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import UIKit

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
    
    private func getProductCondition(condition: String) -> String? {
        let condition = ShoppingSearchProductListItem.Condition(rawValue: condition)
        
        return condition?.description
    }
    
    // TODO: - Consider here products with and without extra taxes
    private func getProductInstallments(for installments: ShoppingSearchProductModel.Installments?) -> NSAttributedString? {
        guard let installments = installments,
              let installmentPriceFormatted = formatPrice(from: installments.amount) else { return nil }
        
        let installmentBaseString = "até \(installments.quantity)x \(installmentPriceFormatted)"
        
        let installmentsStartAttributedString = NSMutableAttributedString(string: "em ", attributes: [
            .foregroundColor: UIColor.appColor(.subtitle)
        ])
        
        let installmentsBaseAttributedString = NSAttributedString(string: installmentBaseString, attributes: [
            .foregroundColor: UIColor.appColor(.promotion)
        ])
        
        installmentsStartAttributedString.append(installmentsBaseAttributedString)
        
        return installmentsStartAttributedString
    }
    
    private func getProductThumbnailURL(imageURL: String) -> URL? {
        return URL(string: imageURL)
    }
    
    private func getProductFreeShipping(isFreeShipping: Bool?) -> Bool {
        return isFreeShipping ?? false
    }
    
    private func createSearchProductListItem(product: ShoppingSearchProductModel) -> ShoppingSearchProductListItem {
        ShoppingSearchProductListItem(id: product.id,
                                      image: getProductThumbnailURL(imageURL: product.thumbnail),
                                      name: product.title,
                                      originalPrice: formatPrice(from: product.price),
                                      promotionalPrice: formatPrice(from: product.salePrice),
                                      installments: getProductInstallments(for: product.installments),
                                      isFreeDelivered: getProductFreeShipping(isFreeShipping: product.shipping?.freeShipping),
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
