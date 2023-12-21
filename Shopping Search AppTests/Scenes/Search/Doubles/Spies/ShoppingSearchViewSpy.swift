//
//  ShoppingSearchViewSpy.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import UIKit
@testable import Shopping_Search_App

final class ShoppingSearchViewSpy: UIView {
    // MARK: - Spy Properties
    private(set) var setSearchButtonLoadingStateCallArgs: [Bool] = []
    private(set) var didReceiveSearchErrorCallArgs: [String] = []
    
    // MARK: - Properties
    var didTapSearchButton: ((String?) -> Void)?
}

// MARK: - ShoppingSearchViewType
extension ShoppingSearchViewSpy: ShoppingSearchViewType {
    func setSearchButtonLoadingState(isLoading: Bool) {
        setSearchButtonLoadingStateCallArgs.append(isLoading)
    }
    
    func didReceiveSearchError(withMessage message: String) {
        didReceiveSearchErrorCallArgs.append(message)
    }
}
