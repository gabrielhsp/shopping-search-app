//
//  ShoppingSearchProductsListViewTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import UIKit
import Nimble
import Nimble_Snapshots
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchProductsListViewTests: QuickSpec {
    override class func spec() {
        var frame: CGRect!
        var sut: ShoppingSearchProductsListView!
        
        beforeEach {
            frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 480))
            sut = ShoppingSearchProductsListView(frame: frame)
        }
        
        describe("#init") {
            it("should have a data source object with empty items") {
                expect(sut.dataSource.items).to(beEmpty())
            }
            
            it("should have a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
        
        describe("#setDataSource") {
            var dataSourceStub: ShoppingSearchProductsListDataSource!
            var itemsStub: [ShoppingSearchProductListItem]!
            
            beforeEach {
                itemsStub = [
                    .stub(),
                    .stub(),
                    .stub(isFreeDelivered: false),
                    .stub(promotionalPrice: nil, installments: nil, condition: "Produto usado"),
                ]
                
                dataSourceStub = ShoppingSearchProductsListDataSource(items: itemsStub)
                
                sut.setDataSource(dataSource: dataSourceStub)
            }
            
            it("should set a new object for data source property with the items passed as argument") {
                expect(sut.dataSource).to(equal(dataSourceStub))
            }
            
            it("should have a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
