//
//  ShoppingSearchRepositoryMock.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation
@testable import Shopping_Search_App

final class ShoppingSearchRepositoryMock {
    // MARK: - Spy Properties
    private(set) var requestSearchCallArgs: [String] = []
    
    // MARK: - Mock Properties
    var requestSearchCompletionResult: Result<ShoppingSearchModel, Error> = {
        let dummyError = NSError(domain: ErrorResponse.invalidEndpoint.domain, code: ErrorResponse.invalidEndpoint.rawValue)
        
        return .failure(dummyError)
    }()
}

// MARK: - ShoppingSearchRepositoryType
extension ShoppingSearchRepositoryMock: ShoppingSearchRepositoryType {
    func requestSearch(searchTerm: String, completion: @escaping (Result<ShoppingSearchModel, Error>) -> Void) {
        requestSearchCallArgs.append(searchTerm)
        
        completion(requestSearchCompletionResult)
    }
}
