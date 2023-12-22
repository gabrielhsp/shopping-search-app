//
//  NetworkServiceMock.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 22/12/23.
//

import Foundation
@testable import Shopping_Search_App

final class NetworkServiceMock {
    // MARK: - Spy Properties
    private(set) var requestCallArgs: [any DataRequest] = []
    
    // MARK: - Mock Properties
    var requestCompletionToBeReturned: Result<Data, Error>?
}

// MARK: - NetworkServiceType
extension NetworkServiceMock: NetworkServiceType {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {
        requestCallArgs.append(request)
        
        completion(requestCompletionToBeReturned as! Result<Request.Response, Error>)
    }
}
