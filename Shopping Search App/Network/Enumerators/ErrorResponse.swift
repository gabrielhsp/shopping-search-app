//
//  ErrorResponse.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 16/12/23.
//

import Foundation

enum ErrorResponse: String, Error {
    case invalidEndpoint = "Invalid Endpoint"
    case invalidResponse = "Invalid Response"
    case unprocessableEntity = "Unprocessable Entity"
}
