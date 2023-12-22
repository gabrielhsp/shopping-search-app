//
//  ShoppingSearchProductsListViewControllerTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import UIKit
import Nimble
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchProductsListViewControllerTests: QuickSpec {
    override class func spec() {
        var presenterSpy: ShoppingSearchProductsListPresenterSpy!
        var contentViewSpy: ShoppingSearchProductsListViewSpy!
        var dispatchQueueSpy: DispatchQueueSpy!
        var sut: ShoppingSearchProductsListViewController!
        
        beforeEach {
            presenterSpy = ShoppingSearchProductsListPresenterSpy()
            contentViewSpy = ShoppingSearchProductsListViewSpy()
            dispatchQueueSpy = DispatchQueueSpy()
            sut = ShoppingSearchProductsListViewController(presenter: presenterSpy,
                                                           contentView: contentViewSpy,
                                                           dispatchQueue: dispatchQueueSpy)
            
            sut.loadViewIfNeeded()
        }
        
        describe("#init") {
            it("should set controller property on presenter as the own controller") {
                expect(presenterSpy.controller).to(beIdenticalTo(sut))
            }
        }
        
        describe("#loadView") {
            it("should have a ShoppingSearchProductsListViewType as the current view") {
                expect(sut.view).to(beAKindOf(ShoppingSearchProductsListViewType.self))
            }
        }
        
        describe("#viewDidLoad") {
            it("should set a title for the view controller") {
                expect(sut.title).to(equal("Resultados da busca"))
            }
            
            it("should call presenter get products list method once") {
                expect(presenterSpy.getProductsListCallCount).to(equal(1))
            }
            
            context("when controller is hoisted on a navigation controller") {
                var navigationController: UINavigationController!
                
                beforeEach {
                    navigationController = UINavigationController(rootViewController: sut)
                    
                    sut.viewDidLoad()
                }
                
                it("should set custom configurations for items on navigation controller") {
                    let assertObject = navigationController.navigationBar
                    
                    expect(assertObject.prefersLargeTitles).to(beTrue())
                    expect(assertObject.tintColor).to(equal(.appColor(.title)))
                    expect(navigationController.navigationItem.backButtonDisplayMode).to(equal(.minimal))
                }
            }
        }
        
        describe("#didRequestProductsSuccessfully") {
            var dataSourceStub: ShoppingSearchProductsListDataSource!
            
            beforeEach {
                dataSourceStub = ShoppingSearchProductsListDataSource(items: [.stub()])
                
                sut.didRequestProductsSuccessfully(dataSource: dataSourceStub)
            }
            
            it("should call content view set data source method once") {
                expect(contentViewSpy.setDataSourceCallArgs.count).to(equal(1))
                expect(contentViewSpy.setDataSourceCallArgs.last).to(equal(dataSourceStub))
            }
        }
    }
}
