//
//  ShoppingSearchDataRequestTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 21/12/23.
//

import Foundation
import Nimble
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchDataRequestTests: QuickSpec {
    override class func spec() {
        var dummySearchTerm: String!
        var sut: ShoppingSearchDataRequest!
        
        beforeEach {
            dummySearchTerm = "dummy"
            sut = ShoppingSearchDataRequest(searchTerm: dummySearchTerm)
        }
        
        describe("#init") {
            it("should have a valid path with search endpoint") {
                expect(sut.url).to(equal("https://api.mercadolibre.com/sites/MLB/search"))
            }
            
            it("should return a GET method for request") {
                expect(sut.method).to(equal(.get))
            }
            
            it("should return search term as one of the query items of request") {
                expect(sut.queryItems).to(equal(["q": dummySearchTerm]))
            }
        }
    }
}
