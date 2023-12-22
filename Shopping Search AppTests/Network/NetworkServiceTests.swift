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
            
            afterEach {
                requestResultSuccessCallArgs = []
                requestResultFailureCallArgs = []
            }
            
            context("when service url is invalid and network service can't unwrap URL Components") {
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
            
            context("when service url is valid and url contains query items and custom headers") {
                beforeEach {
                    requestMock = DataRequestMock(url: "https://api.mercadolibre.com/sites/MLB/search",
                                                  headers: ["api_version": "1"],
                                                  queryItems: ["q": "iPhone"])
                    
                    sut.request(requestMock) { result in
                        switch result {
                        case .success(let success):
                            requestResultSuccessCallArgs.append(success)
                        case .failure(let failure):
                            requestResultFailureCallArgs.append(failure)
                        }
                    }
                }
                
                it("should call request method once with a failure result returning an invalid response error") {
                    let assertErrorObject = requestResultFailureCallArgs.last as? NSError
                    let expectedError = createExpectedError(error: .invalidResponse, userInfo: [NSLocalizedDescriptionKey: "Unexpected status code: -1"])
                    
                    expect(requestResultFailureCallArgs.count).to(equal(1))
                    expect(assertErrorObject).to(equal(expectedError))
                }
                
                it("should call url session data task method once") {
                    let assertObject = urlSessionMock.dataTaskCallArgs.last
                    
                    expect(urlSessionMock.dataTaskCallArgs.count).to(equal(1))
                    expect(assertObject?.url?.absoluteString).to(equal("https://api.mercadolibre.com/sites/MLB/search?q=iPhone"))
                    expect(assertObject?.httpMethod).to(equal("GET"))
                    expect(assertObject?.allHTTPHeaderFields).to(equal(["api_version": "1"]))
                }
            }
            
            context("when url request is valid and the data task is called") {
                beforeEach {
                    requestMock = DataRequestMock(url: "https://api.mercadolibre.com/sites/MLB/search",
                                                  headers: ["api_version": "1"],
                                                  queryItems: ["q": "iPhone"])
                }
                
                context("and error object has value") {
                    var dummyError: NSError!
                    
                    beforeEach {
                        dummyError = NSError(domain: "Unavailable service", code: 500)
                        urlSessionMock.error = dummyError
                        
                        sut.request(requestMock) { result in
                            switch result {
                            case .success(let success):
                                requestResultSuccessCallArgs.append(success)
                            case .failure(let failure):
                                requestResultFailureCallArgs.append(failure)
                            }
                        }
                    }
                    
                    it("should call request method once with a failure result returning an unavailable service error") {
                        let assertErrorObject = requestResultFailureCallArgs.last as? NSError
                        
                        expect(requestResultFailureCallArgs.count).to(equal(1))
                        expect(assertErrorObject).to(equal(dummyError))
                    }
                    
                    it("should call url session data task method once") {
                        let assertObject = urlSessionMock.dataTaskCallArgs.last
                        
                        expect(urlSessionMock.dataTaskCallArgs.count).to(equal(1))
                        expect(assertObject?.url?.absoluteString).to(equal("https://api.mercadolibre.com/sites/MLB/search?q=iPhone"))
                        expect(assertObject?.httpMethod).to(equal("GET"))
                        expect(assertObject?.allHTTPHeaderFields).to(equal(["api_version": "1"]))
                    }
                }
                
                context("and status code is between 200 and 299, but data is nil") {
                    var dummyURL: URL!
                    var dummyResponse: HTTPURLResponse!
                    
                    beforeEach {
                        dummyURL = URL(string: requestMock.url)
                        dummyResponse = HTTPURLResponse(url: dummyURL, statusCode: 200, httpVersion: nil, headerFields: nil)
                        urlSessionMock.response = dummyResponse
                        
                        sut.request(requestMock) { result in
                            switch result {
                            case .success(let success):
                                requestResultSuccessCallArgs.append(success)
                            case .failure(let failure):
                                requestResultFailureCallArgs.append(failure)
                            }
                        }
                    }
                    
                    it("should call request method once with a failure result returning an error") {
                        let assertErrorObject = requestResultFailureCallArgs.last as? NSError
                        let expectedError = createExpectedError(error: .unprocessableEntity)
                        
                        expect(requestResultFailureCallArgs.count).to(equal(1))
                        expect(assertErrorObject).to(equal(expectedError))
                    }
                    
                    it("should call url session data task method once") {
                        let assertObject = urlSessionMock.dataTaskCallArgs.last
                        
                        expect(urlSessionMock.dataTaskCallArgs.count).to(equal(1))
                        expect(assertObject?.url?.absoluteString).to(equal("https://api.mercadolibre.com/sites/MLB/search?q=iPhone"))
                        expect(assertObject?.httpMethod).to(equal("GET"))
                        expect(assertObject?.allHTTPHeaderFields).to(equal(["api_version": "1"]))
                    }
                }
                
                context("and the response response is decoded") {
                    var dummyURL: URL!
                    var dummyResponse: HTTPURLResponse!
                    var dummyData: Data!
                    
                    beforeEach {
                        dummyURL = URL(string: requestMock.url)
                        dummyResponse = HTTPURLResponse(url: dummyURL, statusCode: 200, httpVersion: nil, headerFields: nil)
                        dummyData = try JSONSerialization.data(withJSONObject: ["response": "value", "count": 1])
                        
                        urlSessionMock.data = dummyData
                        urlSessionMock.response = dummyResponse
                        
                        sut.request(requestMock) { result in
                            switch result {
                            case .success(let success):
                                requestResultSuccessCallArgs.append(success)
                            case .failure(let failure):
                                requestResultFailureCallArgs.append(failure)
                            }
                        }
                    }
                    
                    it("should call request method once with a success result returning an error") {
                        let expectedResponse = ResponseDummy(response: "value", count: 1)
                        
                        expect(requestResultSuccessCallArgs.count).to(equal(1))
                        expect(requestResultSuccessCallArgs.last).to(equal(expectedResponse))
                    }
                    
                    it("should call url session data task method once") {
                        let assertObject = urlSessionMock.dataTaskCallArgs.last
                        
                        expect(urlSessionMock.dataTaskCallArgs.count).to(equal(1))
                        expect(assertObject?.url?.absoluteString).to(equal("https://api.mercadolibre.com/sites/MLB/search?q=iPhone"))
                        expect(assertObject?.httpMethod).to(equal("GET"))
                        expect(assertObject?.allHTTPHeaderFields).to(equal(["api_version": "1"]))
                    }
                }
                
                context("and the response is decoded with an error") {
                    var dummyURL: URL!
                    var dummyResponse: HTTPURLResponse!
                    var dummyData: Data!
                    
                    beforeEach {
                        dummyURL = URL(string: requestMock.url)
                        dummyResponse = HTTPURLResponse(url: dummyURL, statusCode: 200, httpVersion: nil, headerFields: nil)
                        dummyData = try JSONSerialization.data(withJSONObject: ["value": "response", "count": 1])
                        
                        urlSessionMock.data = dummyData
                        urlSessionMock.response = dummyResponse
                        
                        sut.request(requestMock) { result in
                            switch result {
                            case .success(let success):
                                requestResultSuccessCallArgs.append(success)
                            case .failure(let failure):
                                requestResultFailureCallArgs.append(failure)
                            }
                        }
                    }
                    
                    it("should call request method once with a failure result returning an error") {
                        let assertErrorObject = requestResultFailureCallArgs.last as? NSError
                        let expectedUserInfo: [String: Any] = [
                            "NSCodingPath": [],
                            "NSDebugDescription": "No value associated with key CodingKeys(stringValue: \"response\", intValue: nil) (\"response\")."
                        ]
                        let expectedError = NSError(domain: "NSCocoaErrorDomain", code: 4865, userInfo: expectedUserInfo)
                        
                        expect(requestResultFailureCallArgs.count).to(equal(1))
                        expect(assertErrorObject).to(equal(expectedError))
                    }
                    
                    it("should call url session data task method once") {
                        let assertObject = urlSessionMock.dataTaskCallArgs.last
                        
                        expect(urlSessionMock.dataTaskCallArgs.count).to(equal(1))
                        expect(assertObject?.url?.absoluteString).to(equal("https://api.mercadolibre.com/sites/MLB/search?q=iPhone"))
                        expect(assertObject?.httpMethod).to(equal("GET"))
                        expect(assertObject?.allHTTPHeaderFields).to(equal(["api_version": "1"]))
                    }
                }
            }
        }
        
        func createExpectedError(error: ErrorResponse, userInfo: [String: Any]? = nil) -> NSError {
            return NSError(domain: error.domain, code: error.rawValue, userInfo: userInfo)
        }
    }
}
