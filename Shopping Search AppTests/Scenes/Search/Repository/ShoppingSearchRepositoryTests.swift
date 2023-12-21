//
//  ShoppingSearchRepositoryTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation
import Nimble
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchRepositoryTests: QuickSpec {
    override class func spec() {
        var networkServiceMock: NetworkServiceMock!
        var sut: ShoppingSearchRepository!
        
        beforeEach {
            networkServiceMock = NetworkServiceMock()
            sut = ShoppingSearchRepository(networkService: networkServiceMock)
        }
        
        describe("#requestSearch") {
            let dummySearchTerm = "dummy"
            var completionCallArgs: [Result<ShoppingSearchModel, Error>] = []
            
            afterEach {
                completionCallArgs = []
            }
            
            context("when network service response returns a failure result") {
                var dummyError = NSError(domain: ErrorResponse.unprocessableEntity.domain, code: ErrorResponse.unprocessableEntity.rawValue)
                
                beforeEach {
                    networkServiceMock.requestResult = .failure(dummyError)
                    
                    sut.requestSearch(searchTerm: dummySearchTerm) { result in
                        completionCallArgs.append(result)
                    }
                }
                
                it("should call network service once with a failure result") {
                    let assertObject = networkServiceMock.requestCallArgs.last
                    
                    expect(networkServiceMock.requestCallArgs.count).to(equal(1))
                    expect(assertObject).to(beAKindOf(ShoppingSearchDataRequest.self))
                }
                
                it("should call completion with a failure result once") {
                    expect(completionCallArgs.count).to(equal(1))
                }
            }
            
            context("when network service response returns a successfull result") {
                
            }
        }
    }
}
