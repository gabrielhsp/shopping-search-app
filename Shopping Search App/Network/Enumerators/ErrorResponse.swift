//
//  ErrorResponse.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 16/12/23.
//

import Foundation

enum ErrorResponse: Int, Error, Equatable {
    case invalidEndpoint = 404
    case invalidResponse = 417
    case unprocessableEntity = 422
    
    var domain: String {
        switch self {
        case .invalidEndpoint:
            return "Invalid Endpoint"
        case .invalidResponse:
            return "Invalid Response"
        case .unprocessableEntity:
            return "Unprocessable Entity"
        }
    }
}
