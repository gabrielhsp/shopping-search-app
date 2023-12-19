//
//  ShoppingSearchTextField.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 19/12/23.
//

import UIKit

final class ShoppingSearchTextField: UITextField {
    // MARK: - Properties
    private let padding = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 32)
    
    // MARK: - Initializer Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFieldConfiguration()
        setupFieldLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // MARK: - Private Methods
    private func setupFieldConfiguration() {
        autocorrectionType = .no
        autocapitalizationType = .none
        clearButtonMode = .whileEditing
    }
    
    private func setupFieldLayout() {
        backgroundColor = .appColor(.textFieldBackground)
        textColor = .appColor(.textFieldValue)
        setCornerRadius(radius: 16)
        attributedPlaceholder = NSAttributedString(string: "O que você está procurando?", attributes: [
            .foregroundColor: UIColor.appColor(.textFieldPlaceholder)
        ])
    }
}
