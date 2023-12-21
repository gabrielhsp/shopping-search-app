//
//  ShoppingSearchProductsListProtocols.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import UIKit

protocol ShoppingSearchProductsListViewControllerType: AnyObject {
    func didRequestProductsSuccessfully(dataSource: ShoppingSearchProductsListDataSource)
}

protocol ShoppingSearchProductsListPresenterType: AnyObject {
    var controller: ShoppingSearchProductsListViewControllerType? { get set }
    func getProductsList()
}

protocol ShoppingSearchProductsListViewType where Self: UIView {
    func setDataSource(dataSource: ShoppingSearchProductsListDataSource)
}
