//
//  LocalizedStrings.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 22/12/23.
//

import Foundation

struct LocalizedStrings: Equatable {
    static let search = NSLocalizedString("search", comment: "Busca")
    static let searchErrorGeneral = NSLocalizedString("search_error_general", comment: "Houve um erro ao realizar sua busca. Por favor, tente novamente.")
    static let searchErrorValidTerm = NSLocalizedString("search_error_valid_term", comment: "Digite um termo de busca válido")
    static let searchErrorEmptyResult = NSLocalizedString("search_error_empty_result", comment: "Sua busca não retornou nenhum resultado. Por favor, tente novamente.")
    static let searchTextFieldPlaceholder = NSLocalizedString("search_text_field_placeholder", comment: "O que você está procurando?")
    static let searchButtonTitle = NSLocalizedString("search_button_title", comment: "Buscar")
    static let searchResultsTitle = NSLocalizedString("search_results_title", comment: "Resultados da busca")
    static let freeTaxes = NSLocalizedString("free_taxes", comment: "sem juros")
    static let freeShipping = NSLocalizedString("free_shipping", comment: "Frete Grátis")
    static let productConditionNew = NSLocalizedString("product_condition_new", comment: "Produto novo")
    static let productConditionUsed = NSLocalizedString("product_condition_used", comment: "Produto usado")
}
