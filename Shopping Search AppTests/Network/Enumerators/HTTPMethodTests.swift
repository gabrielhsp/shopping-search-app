//
//  HTTPMethodTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 16/12/23.
//

import Foundation
import Nimble
import Quick
@testable import Shopping_Search_App

final class HTTPMethodTests: QuickSpec {
    override class func spec() {
        var sut: HTTPMethod!
        
        context("when http method is initialized with a GET value") {
            beforeEach {
                sut = HTTPMethod(rawValue: "GET")
            }
            
            it("should return a get case for http method") {
                expect(sut).to(equal(.get))
            }
        }
        
        context("when http method is initialized with a POST value") {
            beforeEach {
                sut = HTTPMethod(rawValue: "POST")
            }
            
            it("should return a post case for http method") {
                expect(sut).to(equal(.post))
            }
        }
        
        context("when http method is initialized with a PUT value") {
            beforeEach {
                sut = HTTPMethod(rawValue: "PUT")
            }
            
            it("should return a put case for http method") {
                expect(sut).to(equal(.put))
            }
        }
        
        context("when http method is initialized with a PATCH value") {
            beforeEach {
                sut = HTTPMethod(rawValue: "PATCH")
            }
            
            it("should return a put case for http method") {
                expect(sut).to(equal(.patch))
            }
        }
        
        context("when http method is initialized with a DELETE value") {
            beforeEach {
                sut = HTTPMethod(rawValue: "DELETE")
            }
            
            it("should return a delete case for http method") {
                expect(sut).to(equal(.delete))
            }
        }
        
        context("when http method is initialized with an unmatched value") {
            beforeEach {
                sut = HTTPMethod(rawValue: "INVALID_METHOD")
            }
            
            it("should return a nil object") {
                expect(sut).to(beNil())
            }
        }
    }
}
