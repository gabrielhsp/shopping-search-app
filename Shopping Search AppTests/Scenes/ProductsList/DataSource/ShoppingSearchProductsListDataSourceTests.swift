//
//  ShoppingSearchProductsListDataSourceTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import UIKit
import Nimble
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchProductsListDataSourceTests: QuickSpec {
    override class func spec() {
        var shoppingSearchProductListItem: ShoppingSearchProductListItem!
        var tableViewDummy: UITableView!
        var sut: ShoppingSearchProductsListDataSource!
        
        beforeEach {
            shoppingSearchProductListItem = .stub()
            tableViewDummy = UITableView()
            tableViewDummy.register(ShoppingSearchProductsListCell.self, forCellReuseIdentifier: String(describing: ShoppingSearchProductsListCell.self))
            
            sut = ShoppingSearchProductsListDataSource(items: [shoppingSearchProductListItem])
        }
        
        describe("#numberOfRowsInSection") {
            var assertObject: Int!
            
            beforeEach {
                assertObject = sut.tableView(tableViewDummy, numberOfRowsInSection: 0)
            }
            
            it("should return one item for the respective section") {
                expect(assertObject).to(equal(1))
            }
        }
        
        describe("#heightForRowAt") {
            var assertObject: CGFloat!
            var dummyIndexPath: IndexPath!
            
            beforeEach {
                dummyIndexPath = IndexPath(row: 0, section: 0)
                assertObject = sut.tableView(tableViewDummy, heightForRowAt: dummyIndexPath)
            }
            
            it("should return an automatic dimension height for the current index path") {
                expect(assertObject).to(equal(UITableView.automaticDimension))
            }
        }
        
        describe("#cellForRowAt") {
            var dummyIndexPath: IndexPath!
            
            context("when method is called for an index path out of range") {
                var assertObject: UITableViewCell!
                
                beforeEach {
                    dummyIndexPath = IndexPath(row: 99, section: 99)
                    assertObject = sut.tableView(tableViewDummy, cellForRowAt: dummyIndexPath)
                }
                
                it("should return a cell of UITableViewCell type") {
                    expect(assertObject).to(beAKindOf(UITableViewCell.self))
                }
            }
            
            context("when method is called for a valid index path") {
                var assertObject: ShoppingSearchProductsListCell!
                
                beforeEach {
                    dummyIndexPath = IndexPath(row: 0, section: 0)
                    assertObject = sut.tableView(tableViewDummy, cellForRowAt: dummyIndexPath) as? ShoppingSearchProductsListCell
                }
                
                it("should return a cell of ShoppingSearchProductsListCell type") {
                    expect(assertObject).to(beAKindOf(ShoppingSearchProductsListCell.self))
                }
            }
        }
    }
}
