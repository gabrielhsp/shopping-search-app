//
//  ShoppingSearchProductsListView.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import UIKit

final class ShoppingSearchProductsListView: UIView {
    // MARK: - Properties
    private(set) var dataSource: ShoppingSearchProductsListDataSource = ShoppingSearchProductsListDataSource()
    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.backgroundColor = .none
        
        return tableView
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
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupAdditionalConfiguration() {
        backgroundColor = .background
        tableView.register(ShoppingSearchProductsListCell.self, forCellReuseIdentifier: String(describing: ShoppingSearchProductsListCell.self))
    }
}

// MARK: - ShoppingSearchProductsListViewType
extension ShoppingSearchProductsListView: ShoppingSearchProductsListViewType {
    func setDataSource(dataSource: ShoppingSearchProductsListDataSource) {
        self.dataSource = dataSource
        
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}
