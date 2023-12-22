//
//  ShoppingSearchProductsListViewSpy.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import UIKit
@testable import Shopping_Search_App

final class ShoppingSearchProductsListViewSpy: UIView {
    // MARK: - Spy Properties
    private(set) var setDataSourceCallArgs = [ShoppingSearchProductsListDataSource]()
}

// MARK: - ShoppingSearchProductsListViewType
extension ShoppingSearchProductsListViewSpy: ShoppingSearchProductsListViewType {
    func setDataSource(dataSource: ShoppingSearchProductsListDataSource) {
        setDataSourceCallArgs.append(dataSource)
    }
}
