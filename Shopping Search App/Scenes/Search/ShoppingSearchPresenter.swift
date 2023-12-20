//
//  ShoppingSearchPresenter.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 19/12/23.
//

import Foundation

final class ShoppingSearchPresenter {
    // MARK: - Properties
    private let repository: ShoppingSearchRepositoryType
    weak var controller: ShoppingSearchViewControllerType?
    
    init(repository: ShoppingSearchRepositoryType) {
        self.repository = repository
    }
    
    // MARK: - Private Methods
    private func requestSearch(searchTerm: String) {
        repository.requestSearch(searchTerm: searchTerm) { result in
            switch result {
            case .success(let response):
                print("requestSearch success", response)
            case .failure(let error):
                print("requestSearch error", error)
            }
        }
        
        // TODO: - Add repository implementation here
    }
}

// MARK: - ShoppingSearchPresenterType
extension ShoppingSearchPresenter: ShoppingSearchPresenterType {
    func didRequestSearch(withSearchText searchText: String?) {
        guard let searchTerm = searchText, !searchTerm.isEmpty else {
            controller?.didReceiveSearchError(withMessage: "Digite um termo de busca válido")
            return
        }
        
        requestSearch(searchTerm: searchTerm)
    }
}
