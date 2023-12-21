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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
