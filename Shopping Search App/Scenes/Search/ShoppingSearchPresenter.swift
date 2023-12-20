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
        repository.requestSearch(searchTerm: searchTerm) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handleRequestSearchSuccess(response: response)
            case .failure(let error):
                self?.handleRequestSearchError(error: error)
            }
        }
    }
    
    private func handleRequestSearchSuccess(response: ShoppingSearchModel) {
        guard !response.results.isEmpty else {
            controller?.didReceiveSearchError(withMessage: "Sua busca não retornou nenhum resultado. Por favor, tente novamente.")
            return
        }
        
        controller?.didRequestSearchSuccessfully(response: response)
    }
    
    private func handleRequestSearchError(error: Error) {
        controller?.didReceiveSearchError(withMessage: "Houve um erro ao realizar sua busca. Por favor, tente novamente.")
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
