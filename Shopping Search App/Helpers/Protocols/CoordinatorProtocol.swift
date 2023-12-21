//
//  CoordinatorProtocol.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import UIKit

protocol CoordinatorProtocol {
    var currentViewController: UIViewController? { get }
    var navigationController: UINavigationController { get }
    func start(navigationType: CoordinatorNavigationType)
}

extension CoordinatorProtocol {
    func show(viewController: UIViewController, navigationType: CoordinatorNavigationType, animated: Bool = true) {
        switch navigationType {
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        case .present:
            navigationController.present(viewController, animated: animated)
        }
    }
}
