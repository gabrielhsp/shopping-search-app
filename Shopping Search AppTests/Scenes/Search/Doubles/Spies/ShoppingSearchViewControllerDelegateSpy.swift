//
//  ShoppingSearchViewControllerDelegateSpy.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation
@testable import Shopping_Search_App

final class ShoppingSearchViewControllerDelegateSpy {
    // MARK: - Spy Properties
    private(set) var didRequestSearchSuccessfullyCallArgs: [ShoppingSearchModel] = []
}

// MARK: - ShoppingSearchViewControllerDelegate
extension ShoppingSearchViewControllerDelegateSpy: ShoppingSearchViewControllerDelegate {
    func shoppingSearchViewController(didRequestSearchSuccessfullyWith response: ShoppingSearchModel) {
        didRequestSearchSuccessfullyCallArgs.append(response)
    }
}
