//
//  DataRequestMock.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 18/12/23.
//

import Foundation
@testable import Shopping_Search_App

struct DataRequestMock: DataRequest {
    typealias Response = ResponseDummy
    
    var url: String = "https://api.mercadolibre.com/sites/MLB/search"
    
    var method: HTTPMethod = .get
    
    var headers: [String: String]? = [:]
    
    var queryItems: [String: String]? = [:]
    
    func decode(_ data: Data) throws -> Response {
        return try JSONDecoder().decode(ResponseDummy.self, from: data)
    }
}
