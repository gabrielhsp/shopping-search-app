//
//  UINavigationControllerSpy.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import UIKit

final class UINavigationControllerSpy: UINavigationController {
    // MARK: - Spy Properties
    private(set) var pushViewControllerCallArgs: [(viewController: UIViewController, animated: Bool)] = []
    private(set) var presentCallArgs: [(viewController: UIViewController, animated: Bool)] = []
    
    // MARK: - Override Methods
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerCallArgs.append((viewController, animated))
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentCallArgs.append((viewControllerToPresent, flag))
    }
}
