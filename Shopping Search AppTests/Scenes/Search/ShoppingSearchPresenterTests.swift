//
//  ShoppingSearchPresenterTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation
import Nimble
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchPresenterTests: QuickSpec {
    override class func spec() {
        var repositoryMock: ShoppingSearchRepositoryMock!
        var controllerSpy: ShoppingSearchViewControllerSpy!
        var sut: ShoppingSearchPresenter!
        
        beforeEach {
            repositoryMock = ShoppingSearchRepositoryMock()
            controllerSpy = ShoppingSearchViewControllerSpy()
            sut = ShoppingSearchPresenter(repository: repositoryMock)
            sut.controller = controllerSpy
        }
        
        describe("#didRequestSearch") {
            context("when search term is nil") {
                beforeEach {
                    sut.didRequestSearch(withSearchText: nil)
                }
                
                it("should call controller did receive search error method once") {
                    expect(controllerSpy.didReceiveSearchErrorCallArgs.count).to(equal(1))
                    expect(controllerSpy.didReceiveSearchErrorCallArgs.last).to(equal("Digite um termo de busca válido"))
                }
                
                it("should not call repository request search method") {
                    expect(repositoryMock.requestSearchCallArgs).to(beEmpty())
                }
            }
            
            context("when search term is empty") {
                beforeEach {
                    sut.didRequestSearch(withSearchText: "")
                }
                
                it("should call controller did receive search error method once") {
                    expect(controllerSpy.didReceiveSearchErrorCallArgs.count).to(equal(1))
                    expect(controllerSpy.didReceiveSearchErrorCallArgs.last).to(equal("Digite um termo de busca válido"))
                }
                
                it("should not call repository request search method") {
                    expect(repositoryMock.requestSearchCallArgs).to(beEmpty())
                }
            }
            
            context("when search term is valid") {
                let dummySearchTerm = "dummy"
                
                context("and repository response returns a failure result") {
                    beforeEach {
                        sut.didRequestSearch(withSearchText: dummySearchTerm)
                    }
                    
                    it("should call repository request search method once with the term passed as argument") {
                        expect(repositoryMock.requestSearchCallArgs.count).to(equal(1))
                        expect(repositoryMock.requestSearchCallArgs.last).to(equal(dummySearchTerm))
                    }
                    
                    it("should call controller did receive search error method once") {
                        expect(controllerSpy.didReceiveSearchErrorCallArgs.count).to(equal(1))
                        expect(controllerSpy.didReceiveSearchErrorCallArgs.last).to(equal("Houve um erro ao realizar sua busca. Por favor, tente novamente."))
                    }
                }
                
                context("and repository response returns a successfully result, but with an empty response result") {
                    beforeEach {
                        repositoryMock.requestSearchCompletionResult = .success(.stub(results: []))
                        
                        sut.didRequestSearch(withSearchText: dummySearchTerm)
                    }
                    
                    it("should call repository request search method once with the term passed as argument") {
                        expect(repositoryMock.requestSearchCallArgs.count).to(equal(1))
                        expect(repositoryMock.requestSearchCallArgs.last).to(equal(dummySearchTerm))
                    }
                    
                    it("should call controller did receive search error method once") {
                        expect(controllerSpy.didReceiveSearchErrorCallArgs.count).to(equal(1))
                        expect(controllerSpy.didReceiveSearchErrorCallArgs.last).to(equal("Sua busca não retornou nenhum resultado. Por favor, tente novamente."))
                    }
                }
                
                context("and repository response returns a successfully result") {
                    let responseStub: ShoppingSearchModel = .stub()
                    
                    beforeEach {
                        repositoryMock.requestSearchCompletionResult = .success(responseStub)
                        
                        sut.didRequestSearch(withSearchText: dummySearchTerm)
                    }
                    
                    it("should call repository request search method once with the term passed as argument") {
                        expect(repositoryMock.requestSearchCallArgs.count).to(equal(1))
                        expect(repositoryMock.requestSearchCallArgs.last).to(equal(dummySearchTerm))
                    }
                    
                    it("should call controller did request search successfully once with the success response") {
                        expect(controllerSpy.didRequestSearchSuccessfullyCallArgs.count).to(equal(1))
                        expect(controllerSpy.didRequestSearchSuccessfullyCallArgs.last).to(equal(responseStub))
                    }
                }
            }
        }
    }
}
