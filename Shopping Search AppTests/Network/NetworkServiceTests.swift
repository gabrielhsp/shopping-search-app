//
//  NetworkServiceTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 16/12/23.
//

import Foundation
import Nimble
import Quick
@testable import Shopping_Search_App

final class NetworkServiceTests: QuickSpec {
    override class func spec() {
        var urlSessionMock: URLSessionMock!
        var requestMock: DataRequestMock!
        var sut: NetworkService!
        
        beforeEach {
            urlSessionMock = URLSessionMock()
            sut = NetworkService(urlSession: urlSessionMock)
        }
        
        describe("#request") {
            var requestResultSuccessCallArgs: [DataRequestMock.Response] = []
            var requestResultFailureCallArgs: [Error] = []
            
            context("when url request contains components that can't be safely unwrapped") {
                beforeEach {
                    requestMock = DataRequestMock(url: "123456https://")
                    
                    sut.request(requestMock) { result in
                        switch result {
                        case .success(let success):
                            requestResultSuccessCallArgs.append(success)
                        case .failure(let failure):
                            requestResultFailureCallArgs.append(failure)
                        }
                    }
                }
                
                it("should call request method once with a failure result returning an invalid endpoint error") {
                    let assertErrorObject = requestResultFailureCallArgs.last as? NSError
                    let expectedError = createExpectedError(error: .invalidEndpoint)
                    
                    expect(requestResultFailureCallArgs.count).to(equal(1))
                    expect(assertErrorObject).to(equal(expectedError))
                }
            }
            
            context("when url request contains components that can be safely unwrapped") {
                // TODO: - Add tests here
            }
            
            context("when url request contains query components") {
                // TODO: - Add tests here
            }
            
            context("when url request contains headers") {
                // TODO: - Add tests here
            }
            
            context("when url request is valid and the data task is called") {
                context("and error object has value") {
                    // TODO: - Add tests here
                }
                
                context("and status code is between 200 and 299") {
                    // TODO: - Add tests here
                }
                
                context("and status code is outside the success range") {
                    // TODO: - Add tests here
                }
                
                context("and the response response is decoded") {
                    // TODO: - Add tests here
                }
                
                context("and the response is decoded with an error") {
                    // TODO: - Add tests here
                }
            }
        }
        
        func createExpectedError(error: ErrorResponse, userInfo: [String: Any]? = nil) -> NSError {
            return NSError(domain: error.domain, code: error.rawValue, userInfo: userInfo)
        }
    }
}
