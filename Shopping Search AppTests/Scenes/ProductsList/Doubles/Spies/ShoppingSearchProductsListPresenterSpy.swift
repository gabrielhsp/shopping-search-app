//
//  ShoppingSearchProductsListPresenterSpy.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import UIKit
@testable import Shopping_Search_App

final class ShoppingSearchProductsListPresenterSpy {
    // MARK: - Spy Properties
    private(set) var getProductsListCallCount = 0
    
    // MARK: - Properties
    var controller: ShoppingSearchProductsListViewControllerType?
}

// MARK: - ShoppingSearchProductsListPresenterType
extension ShoppingSearchProductsListPresenterSpy: ShoppingSearchProductsListPresenterType {
    func getProductsList() {
        getProductsListCallCount += 1
    }
}
