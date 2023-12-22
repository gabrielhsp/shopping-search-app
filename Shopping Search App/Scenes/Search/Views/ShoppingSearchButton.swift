//
//  ShoppingSearchButton.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 20/12/23.
//

import UIKit

final class ShoppingSearchButton: UIButton {
    // MARK: - Properties
    var isLoading: Bool = false {
        didSet {
            setupLoading()
        }
    }
    
    // MARK: - UI Components
    private let spinner: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        view.color = .white
        
        return view
    }()
    
    // MARK: - Initializer Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setup() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    private func buildViewHierarchy() {
        addSubview(spinner)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupAdditionalConfiguration() {
        backgroundColor = .appColor(.action)
        setTitle(LocalizedStrings.searchButtonTitle, for: .normal)
        setTitleColor(.white, for: .normal)
        setCornerRadius(radius: 16)
        titleLabel?.font = .boldSystemFont(ofSize: 18)
    }
    
    private func setupLoading() {
        let alpha: CGFloat = isLoading ? 0 : 1
        let isButtonEnabled = !isLoading
        
        isLoading ? spinner.startAnimating() : spinner.stopAnimating()
        titleLabel?.alpha = alpha
        imageView?.alpha = alpha
        isEnabled = isButtonEnabled
    }
}
