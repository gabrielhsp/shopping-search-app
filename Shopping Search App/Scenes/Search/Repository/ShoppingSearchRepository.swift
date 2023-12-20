//
//  ShoppingSearchRepository.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 19/12/23.
//

import Foundation

final class ShoppingSearchRepository {
    // MARK: - Properties
    private let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
}

// MARK: - ShoppingSearchRepositoryType
extension ShoppingSearchRepository: ShoppingSearchRepositoryType {
    func requestSearch(searchTerm: String, completion: @escaping (Result<ShoppingSearchModel, Error>) -> Void) {
        let request = ShoppingSearchDataRequest(searchTerm: searchTerm)
        
        networkService.request(request, completion: completion)
    }
}
