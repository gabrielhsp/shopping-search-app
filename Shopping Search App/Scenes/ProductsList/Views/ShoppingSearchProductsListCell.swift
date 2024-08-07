//
//  ShoppingSearchProductsListCell.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import UIKit
import Kingfisher

final class ShoppingSearchProductsListCell: UITableViewCell {
    // MARK: - UI Components
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.kf.indicatorType = .activity
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.setCornerRadius(radius: 16)
        
        return imageView
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Spacing.extraSmall.rawValue
        
        return stackView
    }()
    
    private let productShippingTitleStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = Spacing.extraExtraSmall.rawValue
        
        return stackView
    }()
    
    private let productFreeShippingLabel: UILabel = {
        let label = UILabel()
        
        label.font = Fonts.extraSmall.applyFont(weight: .regular)
        label.text = LocalizedStrings.freeShipping
        label.textColor = .promotion
        
        return label
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = Fonts.large.applyFont(weight: .medium)
        label.numberOfLines = 3
        label.textColor = .subtitle
        
        return label
    }()
    
    private let productPriceStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = .zero
        
        return stackView
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        
        label.font = Fonts.medium.applyFont(weight: .semibold)
        label.textColor = .title
        
        return label
    }()
    
    private let productPriceInstallmentsLabel: UILabel = {
        let label = UILabel()
        
        label.font = Fonts.small.applyFont(weight: .regular)
        label.textColor = .title
        
        return label
    }()
    
    private let productConditionLabel: UILabel = {
        let label = UILabel()
        
        label.font = Fonts.extraSmall.applyFont(weight: .semibold)
        label.textColor = .action
        
        return label
    }()
    
    // MARK: - Initializer Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        contentView.addSubview(productImageView)
        contentView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(productShippingTitleStackView)
        contentStackView.addArrangedSubview(productPriceStackView)
        contentStackView.addArrangedSubview(productConditionLabel)
        
        productShippingTitleStackView.addArrangedSubview(productFreeShippingLabel)
        productShippingTitleStackView.addArrangedSubview(productTitleLabel)
        
        productPriceStackView.addArrangedSubview(productPriceLabel)
        productPriceStackView.addArrangedSubview(productPriceInstallmentsLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.heightAnchor.constraint(equalToConstant: 90),
            productImageView.widthAnchor.constraint(equalToConstant: 90),
            productImageView.centerYAnchor.constraint(equalTo: contentStackView.centerYAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium.rawValue),
            
            contentStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 120),
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.medium.rawValue),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.small.rawValue),
            contentStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: Spacing.small.rawValue),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.medium.rawValue)
        ])
    }
    
    private func setupAdditionalConfiguration() {
        backgroundColor = .background
        selectionStyle = .none
    }
    
    private func setProductImage(imageURL: URL?) {
        guard let imageURL = imageURL else {
            productImageView.image = .imagePlaceholder
            return
        }
        
        productImageView.kf.setImage(with: imageURL, placeholder: UIImage.imagePlaceholder)
    }
}

extension ShoppingSearchProductsListCell {
    func setItem(item: ShoppingSearchProductListItem) {
        setProductImage(imageURL: item.image)
        productFreeShippingLabel.isHidden = !item.isFreeDelivered
        productTitleLabel.text = item.name
        productPriceLabel.text = item.promotionalPrice ?? item.originalPrice
        productPriceInstallmentsLabel.attributedText = item.installments
        productConditionLabel.isHidden = !(item.condition != nil)
        productConditionLabel.text = item.condition
    }
}
