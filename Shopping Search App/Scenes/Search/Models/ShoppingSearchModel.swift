//
//  ShoppingSearchModel.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 19/12/23.
//

import Foundation

struct ShoppingSearchModel: Decodable, Equatable {
    let siteId: String
    let countryDefaultTimeZone: String
    let query: String?
    let paging: Paging
    let results: [ShoppingSearchProductModel]
    
    struct Paging: Decodable, Equatable {
        let total: Int
        let primaryResults: Int
        let offset: Int
        let limit: Int
    }
}
