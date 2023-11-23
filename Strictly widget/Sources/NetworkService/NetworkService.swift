//
//  NetworkService.swift
//  Strictly
//
//  Created by Kristina Korotkova on 21/07/23.
//

import Foundation
import WidgetKit

final class NetworkService {
    private func getURL(from: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.fastforex.io"
        components.path = "/fetch-one"

        let apiKey = "293cd5c322-db6486a8d3-s4l465"
        let basicCurrency = "RUB"

        let queryItemApiKey = URLQueryItem(name: "api_key", value: apiKey)
        let queryItemBasicCurrency = URLQueryItem(name: "from", value: from)
        let queryItemSymbols = URLQueryItem(name: "to", value: basicCurrency)

        components.queryItems = [queryItemApiKey,
                                 queryItemBasicCurrency,
                                 queryItemSymbols]
        return components.url
    }

    func getExchangeRates(
        from currency: String,
        completion: @escaping (Result<ExchangeRates, Error>) -> Void
    ) {
        let url = getURL(from: currency)
        guard let url = url
        else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil
            else {
                completion(.failure(NetworkError.networkError))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let data = data
            else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }

            do {
                let result = try JSONDecoder().decode(ExchangeRates.self, from: data)
                completion(.success(result))
                WidgetCenter.shared.reloadAllTimelines()
            } catch {
                completion(.failure(NetworkError.parsingError))
            }
        }.resume()
    }
}
