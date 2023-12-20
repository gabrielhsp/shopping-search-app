//
//  ShoppingSearchRepositoryTests.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation
import Nimble
import Quick
@testable import Shopping_Search_App

final class ShoppingSearchRepositoryTests: QuickSpec {
    override class func spec() {
        var sut: ShoppingSearchRepository!
        
        beforeEach {
            sut = ShoppingSearchRepository(networkService: <#T##NetworkServiceType#>)
        }
    }
}
