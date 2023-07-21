//
//  ExchangeRates.swift
//  Strictly
//
//  Created by Kristina Korotkova on 21/07/23.
//

import Foundation

struct ExchangeRates: Decodable {
    let base: String
    let result: [String: Float]
    let updated: String
    let ms: Int
}
