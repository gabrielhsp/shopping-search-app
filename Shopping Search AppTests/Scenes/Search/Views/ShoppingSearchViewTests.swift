//
//  ShoppingSearchViewTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import UIKit
import Nimble
import Nimble_Snapshots
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchViewTests: QuickSpec {
    override class func spec() {
        var sut: ShoppingSearchView!
        
        beforeEach {
            sut = ShoppingSearchView(notificationCenter: NotificationCenter.default)
            sut.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 480))
        }
        
        describe("#init") {
            it("should have a valid snapshot when view is initialized") {
                expect(sut).to(haveValidSnapshot())
            }
            
            context("when search text field has search term typed") {
                beforeEach {
                    sut.searchTextField.text = "iPhone SE"
                }
                
                it("should have a valid snapshot for the search text filled with a search term type") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
            
            context("when search button is tapped and search text field is filled") {
                let dummySearchTerm = "iPhone SE"
                var didTapSearchButtonCallArgs: [String?] = []
                
                beforeEach {
                    sut.didTapSearchButton = { searchTerm in
                        didTapSearchButtonCallArgs.append(searchTerm)
                    }
                    
                    sut.searchTextField.text = dummySearchTerm
                    sut.searchButton.sendActions(for: .touchUpInside)
                }
                
                afterEach {
                    didTapSearchButtonCallArgs = []
                }
                
                it("should call did tap search button binding event once with the search term") {
                    expect(didTapSearchButtonCallArgs.count).to(equal(1))
                    expect(didTapSearchButtonCallArgs.last).to(equal(dummySearchTerm))
                }
            }
        }
        
        describe("#didReceiveSearchError") {
            let errorMessage = "Houve um erro ao realizar sua busca."
            
            context("when search text field is empty") {
                beforeEach {
                    sut.didReceiveSearchError(withMessage: errorMessage)
                }
                
                it("should have a valid snapshot with an error message displayed above the search field") {
                    expect(sut).to(haveValidSnapshot())
                }
                
                it("should set a text value for search feedback label") {
                    expect(sut.searchFeedbackLabel.text).to(equal(errorMessage))
                    expect(sut.searchFeedbackLabel.alpha).to(equal(1))
                }
            }
            
            context("when search text field is filled after the error") {
                beforeEach {
                    sut.didReceiveSearchError(withMessage: errorMessage)
                    
                    sut.searchTextField.text = "iPhone 14"
                    sut.searchTextField.sendActions(for: .editingChanged)
                }
                
                it("should set a text value for search feedback label") {
                    expect(sut.searchFeedbackLabel.text).to(beNil())
                    expect(sut.searchFeedbackLabel.alpha).to(equal(0))
                }
            }
        }
        
        describe("#setSearchButtonLoadingState") {
            beforeEach {
                sut.setSearchButtonLoadingState(isLoading: true)
            }
            
            it("should have a valid snapshot when loading state is true") {
                expect(sut).to(haveValidSnapshot())
            }
            
            it("should set is loading property on search button to true") {
                expect(sut.searchButton.isLoading).to(beTrue())
            }
        }
        
        describe("#textFieldShouldReturn") {
            var dummyTextField: UITextField!
            var didTapSearchButtonCallArgs: [String?] = []
            
            beforeEach {
                dummyTextField = UITextField()
                
                sut.didTapSearchButton = { searchTerm in
                    didTapSearchButtonCallArgs.append(searchTerm)
                }
                
                _ = sut.textFieldShouldReturn(dummyTextField)
            }
            
            afterEach {
                didTapSearchButtonCallArgs = []
            }
            
            it("should set search button is loading property to true") {
                expect(sut.searchButton.isLoading).to(beTrue())
            }
            
            it("should call did tap search button binding event once with the respective search text from text field") {
                expect(didTapSearchButtonCallArgs.count).to(equal(1))
                expect(didTapSearchButtonCallArgs.last).to(equal(""))
            }
        }
    }
}
