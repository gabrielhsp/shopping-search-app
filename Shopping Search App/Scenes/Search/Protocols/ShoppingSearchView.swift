//
//  ShoppingSearchView.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 18/12/23.
//

import UIKit

final class ShoppingSearchView: UIView {
    // MARK: - UI Components
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "O que você busca hoje?"
        searchBar.searchBarStyle = .minimal
        
        return searchBar
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Buscar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    // MARK: - Override Methods
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
        addSubview(searchBar)
//        addSubview(searchButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupAdditionalConfiguration() {
        backgroundColor = .systemBackground
        searchBar.delegate = self
    }
}

// MARK: - ShoppingSearchViewType
extension ShoppingSearchView: ShoppingSearchViewType {
    
}

// MARK: - UISearchBarDelegate
extension ShoppingSearchView: UISearchBarDelegate {
}
