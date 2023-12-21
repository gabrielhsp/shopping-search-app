//
//  ShoppingSearchPresenterSpy.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation
@testable import Shopping_Search_App

final class ShoppingSearchPresenterSpy {
    // MARK: - Spy Properties
    private(set) var didRequestSearchCallArgs: [String?] = []
    
    // MARK: - Properties
    var controller: ShoppingSearchViewControllerType?
}

// MARK: - ShoppingSearchPresenterType
extension ShoppingSearchPresenterSpy: ShoppingSearchPresenterType {
    func didRequestSearch(withSearchText searchText: String?) {
        didRequestSearchCallArgs.append(searchText)
    }
}
