//
//  ShoppingSearchProductsListCell.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import UIKit

final class ShoppingSearchProductsListCell: UITableViewCell {
    // MARK: - UI Components
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.setCornerRadius(radius: 16)
        
        return imageView
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
        return stackView
    }()
    
    // MARK: - Initializer Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        addSubview(productImageView)
        addSubview(contentStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.heightAnchor.constraint(equalToConstant: 120),
            productImageView.widthAnchor.constraint(equalToConstant: 120),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productImageView.centerYAnchor.constraint(equalTo: contentStackView.centerYAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            contentStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 12),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16)
        ])
    }
    
    private func setupAdditionalConfiguration() {
        
    }
}
