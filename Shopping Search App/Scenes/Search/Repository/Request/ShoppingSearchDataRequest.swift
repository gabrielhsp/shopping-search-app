//
//  ShoppingSearchDataRequest.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 19/12/23.
//

import Foundation

struct ShoppingSearchDataRequest: DataRequest {
    typealias Response = ShoppingSearchModel
    
    let searchTerm: String
    
    var url: String {
        let baseURL = "https://api.mercadolibre.com/sites/MLB"
        let path = "/search"
        
        return baseURL + path
    }
    
    var method: HTTPMethod = .get
    
    var queryItems: [String: String]? {
        return ["q": searchTerm]
    }
}
