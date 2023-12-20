//
//  ShoppingSearchViewController.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 18/12/23.
//

import Foundation
import UIKit

final class ShoppingSearchViewController: UIViewController {
    // MARK: - Properties
    private let presenter: ShoppingSearchPresenterType
    private let contentView: ShoppingSearchViewType
    
    // MARK: - Initializer Methods
    init(presenter: ShoppingSearchPresenterType,
         contentView: ShoppingSearchViewType = ShoppingSearchView()) {
        self.presenter = presenter
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        bindLayoutEvents()
        self.presenter.controller = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func loadView() {
        view = contentView
    }
    
    // MARK: - Private Methods
    private func bindLayoutEvents() {
        contentView.didTapSearchButton = { [weak self] searchText in
            self?.presenter.didRequestSearch(withSearchText: searchText)
        }
    }
}

// MARK: - ShoppingSearchViewControllerType
extension ShoppingSearchViewController: ShoppingSearchViewControllerType {
    func didReceiveSearchError(withMessage message: String) {
        contentView.didReceiveSearchError(withMessage: message)
    }
}
