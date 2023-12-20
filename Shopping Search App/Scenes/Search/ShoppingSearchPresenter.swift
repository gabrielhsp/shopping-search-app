//
//  ShoppingSearchPresenter.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 19/12/23.
//

import Foundation

final class ShoppingSearchPresenter {
    // MARK: - Properties
    weak var controller: ShoppingSearchViewControllerType?
    
    // MARK: - Private Methods
    private func requestSearch(searchTerm: String) {
        // TODO: - Add repository implementation here
    }
}

// MARK: - ShoppingSearchPresenterType
extension ShoppingSearchPresenter: ShoppingSearchPresenterType {
    func didRequestSearch(withSearchText searchText: String?) {
        guard let searchText = searchText, !searchText.isEmpty else {
            controller?.didReceiveSearchError(withMessage: "Digite um termo de busca válido")
            return
        }
    }
}
