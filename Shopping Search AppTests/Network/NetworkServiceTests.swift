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
        var sut: NetworkService!
        
        beforeEach {
            urlSessionMock = URLSessionMock()
            sut = NetworkService(urlSession: urlSessionMock)
        }
    }
}
