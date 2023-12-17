//
//  ErrorResponseTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 16/12/23.
//

import Foundation
import Nimble
import Quick
@testable import Shopping_Search_App

final class ErrorResponseTests: QuickSpec {
    override class func spec() {
        var sut: ErrorResponse!
        
        describe("#init") {
            context("when error response is initialized with a 404 value") {
                beforeEach {
                    sut = ErrorResponse(rawValue: 404)
                }
                
                it("should initialize sut with an invalid endpoint case") {
                    expect(sut).to(equal(.invalidEndpoint))
                    expect(sut.domain).to(equal("Invalid Endpoint"))
                }
            }
            
            context("when error response is initialized with a 417 value") {
                beforeEach {
                    sut = ErrorResponse(rawValue: 417)
                }
                
                it("should initialize sut with an invalid endpoint case") {
                    expect(sut).to(equal(.invalidResponse))
                    expect(sut.domain).to(equal("Invalid Response"))
                }
            }
            
            context("when error response is initialized with a 422 value") {
                beforeEach {
                    sut = ErrorResponse(rawValue: 422)
                }
                
                it("should initialize sut with an invalid endpoint case") {
                    expect(sut).to(equal(.unprocessableEntity))
                    expect(sut.domain).to(equal("Unprocessable Entity"))
                }
            }
            
            context("when error response is initialized with an error code that's not mapped") {
                beforeEach {
                    sut = ErrorResponse(rawValue: 999)
                }
                
                it("should return a nil object") {
                    expect(sut).to(beNil())
                }
            }
        }
    }
}
