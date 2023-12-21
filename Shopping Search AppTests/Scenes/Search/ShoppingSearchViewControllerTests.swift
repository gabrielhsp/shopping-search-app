//
//  ShoppingSearchViewControllerTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import UIKit
import Nimble
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchViewControllerTests: QuickSpec {
    override class func spec() {
        var presenterSpy: ShoppingSearchPresenterSpy!
        var contentViewSpy: ShoppingSearchViewSpy!
        var dispatchQueueSpy: DispatchQueueSpy!
        var delegateSpy: ShoppingSearchViewControllerDelegateSpy!
        var sut: ShoppingSearchViewController!
        
        beforeEach {
            presenterSpy = ShoppingSearchPresenterSpy()
            contentViewSpy = ShoppingSearchViewSpy()
            dispatchQueueSpy = DispatchQueueSpy()
            delegateSpy = ShoppingSearchViewControllerDelegateSpy()
            sut = ShoppingSearchViewController(presenter: presenterSpy,
                                               contentView: contentViewSpy,
                                               dispatchQueue: dispatchQueueSpy)
            
            sut.delegate = delegateSpy
            sut.loadViewIfNeeded()
        }
        
        describe("#init") {
            it("should set controller property on presenter as the own controller") {
                expect(presenterSpy.controller).to(beIdenticalTo(sut))
            }
        }
        
        describe("#loadView") {
            it("should have a ShoppingSearchViewType as the current view") {
                expect(sut.view).to(beAKindOf(ShoppingSearchViewType.self))
            }
        }
        
        describe("#bindLayoutEvents") {
            context("when did tap search button is called on content view") {
                let dummySearchTerm = "dummy"
                
                beforeEach {
                    contentViewSpy.didTapSearchButton?(dummySearchTerm)
                }
                
                it("should call presenter did request search method once with the term passed as argument") {
                    expect(presenterSpy.didRequestSearchCallArgs.count).to(equal(1))
                    expect(presenterSpy.didRequestSearchCallArgs.last).to(equal(dummySearchTerm))
                }
            }
        }
        
        describe("#didRequestSearchSuccessfully") {
            let shoppingSearchStub: ShoppingSearchModel = .stub()
            
            beforeEach {
                sut.didRequestSearchSuccessfully(response: shoppingSearchStub)
            }
            
            it("should call content view set search button loading state method once with a false parameter") {
                expect(contentViewSpy.setSearchButtonLoadingStateCallArgs.count).to(equal(1))
                expect(contentViewSpy.setSearchButtonLoadingStateCallArgs.last).to(beFalse())
            }
            
            it("should call delegate did request search successfully method once with the shopping search response") {
                expect(delegateSpy.didRequestSearchSuccessfullyCallArgs.count).to(equal(1))
                expect(delegateSpy.didRequestSearchSuccessfullyCallArgs.last).to(equal(shoppingSearchStub))
            }
        }
        
        describe("#didReceiveSearchError") {
            let dummyErrorMessage = "dummy"
            
            beforeEach {
                sut.didReceiveSearchError(withMessage: dummyErrorMessage)
            }
            
            it("should call content view did receive search error method once with the message passed as argument") {
                expect(contentViewSpy.didReceiveSearchErrorCallArgs.count).to(equal(1))
                expect(contentViewSpy.didReceiveSearchErrorCallArgs.last).to(equal(dummyErrorMessage))
            }
        }
    }
}
