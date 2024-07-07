//
//  ShoppingSearchView.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 18/12/23.
//

import UIKit

final class ShoppingSearchView: UIView {
    // MARK: - Private Properties
    private let notificationCenter: NotificationCenterProtocol
    private var bottomConstraint: NSLayoutConstraint?
    
    // MARK: - Properties
    var didTapSearchButton: ((String?) -> Void)?
    
    // MARK: - UI Components
    private(set) var searchTextField: ShoppingSearchTextField = {
        let textField = ShoppingSearchTextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private(set) var searchFeedbackLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        label.numberOfLines = 0
        label.textColor = .systemRed
        label.font = Fonts.small.applyFont(weight: .regular)
        
        return label
    }()
    
    private let searchSuggestionView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) var searchButton: ShoppingSearchButton = {
        let button = ShoppingSearchButton(type: .custom)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
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
        addSubview(searchFeedbackLabel)
        addSubview(searchSuggestionView)
        addSubview(searchButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Spacing.medium.rawValue),
            searchTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.medium.rawValue),
            searchTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Spacing.medium.rawValue),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            searchFeedbackLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: Spacing.extraSmall.rawValue),
            searchFeedbackLabel.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor),
            searchFeedbackLabel.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor),
            
            searchSuggestionView.topAnchor.constraint(equalTo: searchFeedbackLabel.bottomAnchor, constant: Spacing.extraSmall.rawValue),
            searchSuggestionView.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor),
            searchSuggestionView.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor),
            searchSuggestionView.bottomAnchor.constraint(equalTo: searchButton.topAnchor, constant: -Spacing.medium.rawValue),
            
            searchButton.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor),
            searchButton.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        bottomConstraint = searchButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Spacing.medium.rawValue)
        bottomConstraint?.isActive = true
    }
    
    private func setupAdditionalConfiguration() {
        backgroundColor = .background
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(updateSearchTextFieldFeedback(_:)), for: .editingChanged)
        searchButton.addTarget(self, action: #selector(addActionOnSearchButton), for: .touchUpInside)
    }
    
    private func sendSearchButtonEvent() {
        searchTextField.resignFirstResponder()
        searchButton.isLoading = true
        didTapSearchButton?(searchTextField.text)
    }
    
    @objc
    private func addActionOnSearchButton() {
        sendSearchButtonEvent()
    }
    
    @objc
    private func updateSearchTextFieldFeedback(_ textField: UITextField) {
        if let textFieldValue = textField.text, !textFieldValue.isEmpty {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.searchFeedbackLabel.text = nil
                self?.searchFeedbackLabel.alpha = 0
            }
        }
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
            
            self?.updateBottomConstraint(constant: -(keyboardSize.height + Spacing.medium.rawValue))
        })
        
        _ = notificationCenter.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                           object: nil,
                                           queue: nil,
                                           using: { [weak self] _ in
            self?.updateBottomConstraint(constant: -Spacing.medium.rawValue)
        })
    }
    
    private func updateBottomConstraint(constant: CGFloat) {
        bottomConstraint?.constant = constant
    }
}

// MARK: - ShoppingSearchViewType
extension ShoppingSearchView: ShoppingSearchViewType {
    func didReceiveSearchError(withMessage message: String) {
        searchButton.isLoading = false
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.searchFeedbackLabel.text = message
            self?.searchFeedbackLabel.alpha = 1
        }
    }
    
    func setSearchButtonLoadingState(isLoading: Bool) {
        searchButton.isLoading = isLoading
    }
}

// MARK: - UISearchBarDelegate
extension ShoppingSearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendSearchButtonEvent()
        
        return true
    }
}
