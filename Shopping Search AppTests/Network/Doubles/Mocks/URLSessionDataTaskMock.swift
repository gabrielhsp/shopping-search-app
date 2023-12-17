//
//  URLSessionDataTaskMock.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 16/12/23.
//

import Foundation

final class URLSessionDataTaskMock: URLSessionDataTask {
    // MARK: - Spy Properties
    private(set) var resumeCallCount = 0
    
    // MARK: - Properties
    private let completionHandler: () -> Void
    
    init(completionHandler: @escaping () -> Void) {
        self.completionHandler = completionHandler
        super.init()
    }
    
    override func resume() {
        resumeCallCount += 1
        completionHandler()
    }
}
