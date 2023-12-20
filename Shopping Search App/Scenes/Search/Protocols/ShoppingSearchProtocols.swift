//
//  ShoppingSearchViewType.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 18/12/23.
//

import UIKit

protocol ShoppingSearchViewControllerDelegate: AnyObject {
    func shoppingSearchViewController(didRequestSearchSuccessfullyWith response: ShoppingSearchModel)
}

protocol ShoppingSearchViewControllerType: AnyObject {
    var delegate: ShoppingSearchViewControllerDelegate? { get set }
    func didRequestSearchSuccessfully(response: ShoppingSearchModel)
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
    func setSearchButtonLoadingState(isLoading: Bool)
    func didReceiveSearchError(withMessage message: String)
}
