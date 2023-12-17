//
//  URLSessionMock.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 16/12/23.
//

import Foundation
@testable import Shopping_Search_App

final class URLSessionMock {
    // MARK: - Spy Properties
    private(set) var dataTaskCallArgs: [URLRequest] = []
    
    // MARK: - Properties
    var data: Data?
    var response: URLResponse?
    var error: Error?
}

// MARK: - URLSessionProtocol
extension URLSessionMock: URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallArgs.append(request)
        
        return URLSessionDataTaskMock {
            completionHandler(self.data, self.response, self.error)
        }
    }
}
