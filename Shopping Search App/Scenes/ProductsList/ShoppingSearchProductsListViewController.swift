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
        self.presenter.controller = self
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
        setupNavigationBar()
        presenter.getProductsList()
    }
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        title = "Resultados da busca"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .appColor(.title)
        navigationController?.navigationItem.backButtonDisplayMode = .minimal
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
