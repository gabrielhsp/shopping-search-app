//
//  ShoppingSearchView.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 18/12/23.
//

import UIKit

final class ShoppingSearchView: UIView {
    // MARK: - Properties
    private let notificationCenter: NotificationCenterProtocol
    private var bottomConstraint: NSLayoutConstraint?
    
    // MARK: - UI Components
    private let searchTextField: ShoppingSearchTextField = {
        let textField = ShoppingSearchTextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .appColor(.action)
        button.setTitle("Buscar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setCornerRadius(radius: 16)
        
        return button
    }()
    
    // MARK: - Override Methods
    init(notificationCenter: NotificationCenterProtocol = NotificationCenter.default) {
        self.notificationCenter = notificationCenter
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    // MARK: - Private Methods
    private func setup() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
        registerKeyboardEvents()
    }
    
    private func buildViewHierarchy() {
        addSubview(searchTextField)
        addSubview(searchButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            searchTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            searchButton.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor),
            searchButton.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        bottomConstraint = searchButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        bottomConstraint?.isActive = true
    }
    
    private func setupAdditionalConfiguration() {
        backgroundColor = .appColor(.background)
        searchTextField.delegate = self
    }
    
    private func registerKeyboardEvents() {
        _ = notificationCenter.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                           object: nil,
                                           queue: nil,
                                           using: { [weak self] notification in
            let key = UIResponder.keyboardFrameEndUserInfoKey
            
            guard let keyboardSize = (notification.userInfo?[key] as? NSValue)?.cgRectValue else {
                return
            }
            
            self?.updateBottomConstraint(constant: -keyboardSize.height)
        })
        
        _ = notificationCenter.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                           object: nil,
                                           queue: nil,
                                           using: { [weak self] _ in
            self?.updateBottomConstraint(constant: .zero)
        })
    }
    
    private func updateBottomConstraint(constant: CGFloat) {
        bottomConstraint?.constant = constant
    }
}

// MARK: - ShoppingSearchViewType
extension ShoppingSearchView: ShoppingSearchViewType {
    
}

// MARK: - UISearchBarDelegate
extension ShoppingSearchView: UITextFieldDelegate {
}
