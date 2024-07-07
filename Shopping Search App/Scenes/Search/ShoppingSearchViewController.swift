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
    private let dispatchQueue: DispatchQueueProtocol
    weak var delegate: ShoppingSearchViewControllerDelegate?
    
    // MARK: - Initializer Methods
    init(presenter: ShoppingSearchPresenterType,
         contentView: ShoppingSearchViewType = ShoppingSearchView(),
         dispatchQueue: DispatchQueueProtocol = DispatchQueue.main) {
        self.presenter = presenter
        self.contentView = contentView
        self.dispatchQueue = dispatchQueue
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        title = LocalizedStrings.search
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .title
        navigationController?.navigationItem.backButtonDisplayMode = .minimal
    }
    
    private func bindLayoutEvents() {
        contentView.didTapSearchButton = { [weak self] searchText in
            self?.presenter.didRequestSearch(withSearchText: searchText)
        }
    }
}

// MARK: - ShoppingSearchViewControllerType
extension ShoppingSearchViewController: ShoppingSearchViewControllerType {
    func didRequestSearchSuccessfully(response: ShoppingSearchModel) {
        dispatchQueue.async { [weak self] in
            self?.contentView.setSearchButtonLoadingState(isLoading: false)
            self?.delegate?.shoppingSearchViewController(didRequestSearchSuccessfullyWith: response)
        }
    }
    
    func didReceiveSearchError(withMessage message: String) {
        dispatchQueue.async { [weak self] in
            self?.contentView.didReceiveSearchError(withMessage: message)
        }
    }
}
