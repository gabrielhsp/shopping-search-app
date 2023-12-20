//
//  DataRequest.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 16/12/23.
//

import Foundation

protocol DataRequest {
    associatedtype Response
    
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryItems: [String: String] { get }
    
    func decode(_ data: Data) throws -> Response
}

extension DataRequest where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(Response.self, from: data)
    }
}

extension DataRequest {
    var headers: [String: String] {
        [:]
    }
    
    var queryItems: [String: String] {
        [:]
    }
}
