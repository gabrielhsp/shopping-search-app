//
//  ShoppingSearchProductsListDataSource.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 21/12/23.
//

import UIKit

final class ShoppingSearchProductsListDataSource: NSObject {
    private let items: [ShoppingSearchProductListItem]
    
    init(items: [ShoppingSearchProductListItem] = []) {
        self.items = items
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension ShoppingSearchProductsListDataSource: UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: ShoppingSearchProductsListCell.self)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ShoppingSearchProductsListCell else {
            return UITableViewCell()
        }
        
        cell.setItem(item: items[indexPath.row])
        
        return cell
    }
}
