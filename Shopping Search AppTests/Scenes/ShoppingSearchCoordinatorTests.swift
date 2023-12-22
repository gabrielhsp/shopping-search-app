//
//  ShoppingSearchCoordinatorTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import UIKit
import Nimble
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchCoordinatorTests: QuickSpec {
    override class func spec() {
        var navigationControllerSpy: UINavigationControllerSpy!
        var networkServiceMock: NetworkServiceMock!
        var sut: ShoppingSearchCoordinator!
        
        beforeEach {
            navigationControllerSpy = UINavigationControllerSpy()
            networkServiceMock = NetworkServiceMock()
            sut = ShoppingSearchCoordinator(navigationController: navigationControllerSpy,
                                            networkService: networkServiceMock)
        }
        
        describe("#start") {
            context("when start method is called with a push navigation type") {
                beforeEach {
                    sut.start(navigationType: .push)
                }
                
                it("should set ShoppingSearchViewController as the current view controller") {
                    let assertObject = sut.currentViewController as? ShoppingSearchViewController
                    
                    expect(sut.currentViewController).to(beAKindOf(ShoppingSearchViewController.self))
                    expect(assertObject?.delegate).to(beIdenticalTo(sut))
                }
                
                it("should call navigation controller push method once with ShoppingSearchViewController as the current pushed view controller") {
                    let assertObject = navigationControllerSpy.pushViewControllerCallArgs.last
                    
                    expect(navigationControllerSpy.pushViewControllerCallArgs.count).to(equal(1))
                    expect(assertObject?.viewController).to(beAKindOf(ShoppingSearchViewController.self))
                    expect(assertObject?.animated).to(beTrue())
                }
            }
            
            context("when start method is called with a present navigation type") {
                beforeEach {
                    sut.start(navigationType: .present)
                }
                
                it("should set ShoppingSearchViewController as the current view controller") {
                    expect(sut.currentViewController).to(beAKindOf(ShoppingSearchViewController.self))
                }
                
                it("should call navigation controller present method once with ShoppingSearchViewController as the current presented view controller") {
                    let assertObject = navigationControllerSpy.presentCallArgs.last
                    
                    expect(navigationControllerSpy.presentCallArgs.count).to(equal(1))
                    expect(assertObject?.viewController).to(beAKindOf(ShoppingSearchViewController.self))
                    expect(assertObject?.animated).to(beTrue())
                }
            }
        }
        
        describe("#shoppingSearchViewController(didRequestSearchSuccessfullyWith response:)") {
            beforeEach {
                sut.shoppingSearchViewController(didRequestSearchSuccessfullyWith: .stub())
            }
            
            it("should set ShoppingSearchProductsListViewController as the current view controller") {
                expect(sut.currentViewController).to(beAKindOf(ShoppingSearchProductsListViewController.self))
            }
            
            it("should call navigation controller push method once with ShoppingSearchProductsListViewController as the current pushed view controller") {
                let assertObject = navigationControllerSpy.pushViewControllerCallArgs.last
                
                expect(navigationControllerSpy.pushViewControllerCallArgs.count).to(equal(1))
                expect(assertObject?.viewController).to(beAKindOf(ShoppingSearchProductsListViewController.self))
                expect(assertObject?.animated).to(beTrue())
            }
        }
    }
}
