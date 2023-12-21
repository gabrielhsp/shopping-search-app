//
//  ShoppingSearchProductsListViewController.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import UIKit

final class ShoppingSearchProductsListViewController: UIViewController {
    // MARK: - Properties
    private let presenter: ShoppingSearchProductsListPresenterType
    private let contentView: ShoppingSearchProductsListViewType
    
    init(presenter: ShoppingSearchProductsListPresenterType,
         contentView: ShoppingSearchProductsListViewType) {
        self.presenter = presenter
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - ShoppingSearchProductsListViewControllerType
extension ShoppingSearchProductsListViewController: ShoppingSearchProductsListViewControllerType {
    
}
