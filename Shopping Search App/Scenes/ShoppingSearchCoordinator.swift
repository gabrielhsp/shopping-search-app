//
//  ShoppingSearchCoordinator.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import UIKit

final class ShoppingSearchCoordinator: CoordinatorProtocol {
    // MARK: - Properties
    private let networkService: NetworkServiceType
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    
    // MARK: - Initializer Methods
    init(navigationController: UINavigationController,
         networkService: NetworkServiceType) {
        self.navigationController = navigationController
        self.networkService = networkService
    }
    
    // MARK: - Internal Methods
    func start(navigationType: CoordinatorNavigationType) {
        let controller = createShoppingSearchController()
        
        show(viewController: controller, navigationType: navigationType)
    }
    
    // MARK: - Private Methods
    private func createShoppingSearchController() -> ShoppingSearchViewController {
        let repository = ShoppingSearchRepository(networkService: networkService)
        let presenter = ShoppingSearchPresenter(repository: repository)
        let controller = ShoppingSearchViewController(presenter: presenter)
        
        controller.delegate = self
        currentViewController = controller
        
        return controller
    }
    
    private func createShoppingSearchProductsListController(searchResponse: ShoppingSearchModel) -> ShoppingSearchProductsListViewController {
        let presenter = ShoppingSearchProductsListPresenter(searchResponse: searchResponse)
        let controller = ShoppingSearchProductsListViewController(presenter: presenter)
        
        currentViewController = controller
        
        return controller
    }
}

// MARK: - ShoppingSearchViewControllerDelegate
extension ShoppingSearchCoordinator: ShoppingSearchViewControllerDelegate {
    func shoppingSearchViewController(didRequestSearchSuccessfullyWith response: ShoppingSearchModel) {
        let controller = createShoppingSearchProductsListController(searchResponse: response)
        
        show(viewController: controller, navigationType: .push)
    }
}
