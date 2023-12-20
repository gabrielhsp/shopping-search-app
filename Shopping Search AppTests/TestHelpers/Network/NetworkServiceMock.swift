//
//  NetworkServiceMock.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation
@testable import Shopping_Search_App

final class NetworkServiceMock {
    // MARK: - Spy Properties
    private(set) var requestCallArgs: [any DataRequest] = []
    
    // MARK: - Mock Properties
    var requestResult: Result<Data, Error>?
}

// MARK: - NetworkServiceType
extension NetworkServiceMock: NetworkServiceType {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {
        requestCallArgs.append(request)
        
        if let result = requestResult {
            completion(result as! Result<Request.Response, Error>)
        } else {
            fatalError("There's not a mock result setted for testing, please, provide one.")
        }
    }
}
