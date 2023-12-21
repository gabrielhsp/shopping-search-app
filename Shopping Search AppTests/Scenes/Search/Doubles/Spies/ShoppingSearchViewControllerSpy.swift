//
//  ShoppingSearchViewControllerSpy.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation
@testable import Shopping_Search_App

final class ShoppingSearchViewControllerSpy {
    // MARK: - Spy Properties
    private(set) var didRequestSearchSuccessfullyCallArgs: [ShoppingSearchModel] = []
    private(set) var didReceiveSearchErrorCallArgs: [String] = []
    
    // MARK: - Properties
    var delegate: ShoppingSearchViewControllerDelegate?
}

// MARK: - ShoppingSearchViewControllerType
extension ShoppingSearchViewControllerSpy: ShoppingSearchViewControllerType {
    func didRequestSearchSuccessfully(response: ShoppingSearchModel) {
        didRequestSearchSuccessfullyCallArgs.append(response)
    }
    
    func didReceiveSearchError(withMessage message: String) {
        didReceiveSearchErrorCallArgs.append(message)
    }
}
