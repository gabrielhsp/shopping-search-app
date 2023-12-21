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
    private let dispatchQueue: DispatchQueueProtocol
    
    init(presenter: ShoppingSearchProductsListPresenterType,
         contentView: ShoppingSearchProductsListViewType = ShoppingSearchProductsListView(),
         dispatchQueue: DispatchQueueProtocol = DispatchQueue.main) {
        self.presenter = presenter
        self.contentView = contentView
        self.dispatchQueue = dispatchQueue
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
        presenter.getProductsList()
    }
}

// MARK: - ShoppingSearchProductsListViewControllerType
extension ShoppingSearchProductsListViewController: ShoppingSearchProductsListViewControllerType {
    func didRequestProductsSuccessfully(dataSource: ShoppingSearchProductsListDataSource) {
        dispatchQueue.async { [weak self] in
            self?.contentView.setDataSource(dataSource: dataSource)
        }
    }
}
