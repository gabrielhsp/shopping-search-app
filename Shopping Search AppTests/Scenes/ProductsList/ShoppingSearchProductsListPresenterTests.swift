//
//  ShoppingSearchProductsListPresenterTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import UIKit
import Nimble
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchProductsListPresenterTests: QuickSpec {
    override class func spec() {
        var searchResponseStub: ShoppingSearchModel!
        var controllerSpy: ShoppingSearchProductsListViewControllerSpy!
        var sut: ShoppingSearchProductsListPresenter!
        
        beforeEach {
            searchResponseStub = .stub(results: ShoppingSearchProductModel.stubList())
            controllerSpy = ShoppingSearchProductsListViewControllerSpy()
            sut = ShoppingSearchProductsListPresenter(searchResponse: searchResponseStub)
            
            sut.controller = controllerSpy
        }
        
        describe("#getProductsList") {
            var assertFirstProduct: ShoppingSearchProductListItem!
            var assertSecondProduct: ShoppingSearchProductListItem!
            var assertThirdProduct: ShoppingSearchProductListItem!
            
            beforeEach {
                sut.getProductsList()
                
                assertFirstProduct = controllerSpy.didRequestProductsSuccessfullyCallArgs.last?.items[0]
                assertSecondProduct = controllerSpy.didRequestProductsSuccessfullyCallArgs.last?.items[1]
                assertThirdProduct = controllerSpy.didRequestProductsSuccessfullyCallArgs.last?.items[2]
            }
            
            it("should call controller did request products successfully once with a data source object") {
                expect(controllerSpy.didRequestProductsSuccessfullyCallArgs.count).to(equal(1))
            }
            
            it("should create the first product list item object with free shipping and free taxes installments") {
                expect(assertFirstProduct.image).to(equal(URL(string: "iphone-14.jpg")))
                expect(assertFirstProduct.name).to(equal("iPhone 14 Pro Max"))
                expect(assertFirstProduct.originalPrice).to(equal("R$ 7.200,10"))
                expect(assertFirstProduct.promotionalPrice).to(equal("R$ 6.200,10"))
                expect(assertFirstProduct.installments?.string).to(equal("em até 10x R$ 720,10 sem juros"))
                expect(assertFirstProduct.isFreeDelivered).to(beTrue())
                expect(assertFirstProduct.condition).to(equal("Produto novo"))
            }
            
            it("should create the second product list item object without free shipping and with taxes on installments") {
                expect(assertSecondProduct.image).to(equal(URL(string: "iphone-14.jpg")))
                expect(assertSecondProduct.name).to(equal("iPhone 14 Pro Max"))
                expect(assertSecondProduct.originalPrice).to(equal("R$ 7.200,10"))
                expect(assertSecondProduct.promotionalPrice).to(beNil())
                expect(assertSecondProduct.installments?.string).to(equal("em até 12x R$ 720,10"))
                expect(assertSecondProduct.isFreeDelivered).to(beFalse())
                expect(assertSecondProduct.condition).to(equal("Produto usado"))
            }
            
            it("should create the second product list item object with free shipping and free taxes installments") {
                expect(assertThirdProduct.image).to(equal(URL(string: "iphone-14.jpg")))
                expect(assertThirdProduct.name).to(equal("iPhone 14 Pro Max"))
                expect(assertThirdProduct.originalPrice).to(equal("R$ 7.200,10"))
                expect(assertThirdProduct.promotionalPrice).to(beNil())
                expect(assertThirdProduct.installments?.string).to(beNil())
                expect(assertThirdProduct.isFreeDelivered).to(beFalse())
                expect(assertThirdProduct.condition).to(beNil())
            }
        }
    }
}
