//
//  NetworkError.swift
//  Strictly
//
//  Created by Kristina Korotkova on 22/07/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case networkError
    case invalidResponse
    case parsingError
}
