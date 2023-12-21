//
//  ShoppingSearchModel+Stub.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation
@testable import Shopping_Search_App

extension ShoppingSearchModel {
    static func stub(siteId: String = "MLB",
                     countryDefaultTimeZone: String = "GMT-03:00",
                     query: String? = "dummy",
                     paging: Paging = .stub(),
                     results: [ShoppingSearchProductModel] = [.stub()]) -> Self {
        ShoppingSearchModel(siteId: siteId,
                            countryDefaultTimeZone: countryDefaultTimeZone,
                            query: query,
                            paging: paging,
                            results: results)
    }
}

extension ShoppingSearchModel.Paging {
    static func stub(total: Int = 32092,
                     primaryResults: Int = 1000,
                     offset: Int = 0,
                     limit: Int = 50) -> Self {
        ShoppingSearchModel.Paging(total: total,
                                   primaryResults: primaryResults,
                                   offset: offset,
                                   limit: limit)
    }
}
