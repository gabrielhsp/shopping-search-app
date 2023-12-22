//
//  ShoppingSearchProductsListViewControllerSpy.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import UIKit
@testable import Shopping_Search_App

final class ShoppingSearchProductsListViewControllerSpy {
    // MARK: - Spy Properties
    private(set) var didRequestProductsSuccessfullyCallArgs = [ShoppingSearchProductsListDataSource]()
}

// MARK: - ShoppingSearchProductsListViewControllerType
extension ShoppingSearchProductsListViewControllerSpy: ShoppingSearchProductsListViewControllerType {
    func didRequestProductsSuccessfully(dataSource: ShoppingSearchProductsListDataSource) {
        didRequestProductsSuccessfullyCallArgs.append(dataSource)
    }
}
