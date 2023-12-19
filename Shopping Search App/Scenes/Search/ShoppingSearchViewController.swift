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
    private let contentView: ShoppingSearchViewType
    
    // MARK: - Initializer Methods
    init(contentView: ShoppingSearchViewType = ShoppingSearchView()) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        bindLayoutEvents()
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
        contentView.didTapSearchButton = { searchText in
            print("searchText", searchText)
        }
    }
}
