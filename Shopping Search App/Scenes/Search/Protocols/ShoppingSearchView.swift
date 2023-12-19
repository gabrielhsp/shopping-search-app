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
        searchBar.showsCancelButton = true
        
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
        addSubview(searchButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            searchBar.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchBar.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchBar.heightAnchor.constraint(equalToConstant: 100),
            
            searchButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            searchButton.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            searchButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            searchButton.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupAdditionalConfiguration() {
        
    }
}

// MARK: - ShoppingSearchViewType
extension ShoppingSearchView: ShoppingSearchViewType {
    
}
