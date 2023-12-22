//
//  ShoppingSearchProductsListCellTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import Foundation
import Nimble
import Nimble_Snapshots
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchProductsListCellTests: QuickSpec {
    override class func spec() {
        var frame: CGRect!
        var sut: ShoppingSearchProductsListCell!
        
        beforeEach {
            frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 160))
            sut = ShoppingSearchProductsListCell(style: .default, reuseIdentifier: nil)
            sut.frame = frame
        }
        
        describe("#setItem") {
            var itemStub: ShoppingSearchProductListItem!
            
            context("when method is called with all properties filled") {
                beforeEach {
                    itemStub = .stub()
                    
                    sut.setItem(item: itemStub)
                }
                
                it("should have a valid snapshot") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
            
            context("when method is called without promotional price, installments and is a used product") {
                beforeEach {
                    itemStub = .stub(image: nil,
                                     promotionalPrice: nil,
                                     installments: nil,
                                     isFreeDelivered: false,
                                     condition: "Produto usado")
                    
                    sut.setItem(item: itemStub)
                }
                
                it("should have a valid snapshot") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
    }
}
