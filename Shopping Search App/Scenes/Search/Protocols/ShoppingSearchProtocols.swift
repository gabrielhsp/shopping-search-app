//
//  ShoppingSearchViewType.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 18/12/23.
//

import UIKit

protocol ShoppingSearchViewControllerType: AnyObject {
    func didReceiveSearchError(withMessage message: String)
}

protocol ShoppingSearchPresenterType: AnyObject {
    var controller: ShoppingSearchViewControllerType? { get set }
    func didRequestSearch(withSearchText searchText: String?)
}

protocol ShoppingSearchRepositoryType {
    func requestSearch(searchTerm: String, completion: @escaping (Result<ShoppingSearchModel, Error>) -> Void)
}

protocol ShoppingSearchViewType where Self: UIView {
    var didTapSearchButton: ((String?) -> Void)? { get set }
    func didReceiveSearchError(withMessage message: String)
}
