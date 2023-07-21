//
//  NetworkService.swift
//  Strictly
//
//  Created by Kristina Korotkova on 21/07/23.
//

import Foundation

class NetworkService {
    func getURL(from: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.fastforex.io"
        components.path = "/fetch-one"

        let apiKey = "ba8d8c06b1-56a3bbbaca-ry3apa"
        let baseCurrency = "RUB"

        let queryItemApiKey = URLQueryItem(name: "api_key", value: apiKey)
        let queryItemBaseCurrency = URLQueryItem(name: "from", value: from)
        let queryItemSymbols = URLQueryItem(name: "to", value: baseCurrency)

        components.queryItems = [queryItemApiKey,
                                 queryItemBaseCurrency,
                                 queryItemSymbols]


        return components.url
    }

    func getExchangeRates(
        from currency: String,
        completion: @escaping (ExchangeRates) -> Void
    ) {
        let url = getURL(from: currency)
        guard let url = url else {
            return print("Ошибка URL")
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { return print("ERROR") }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data
            else { return }

            var result: ExchangeRates?

            do {
                result = try JSONDecoder().decode(ExchangeRates.self, from: data)
            } catch {
                print("Ошибка парсинга")
            }

            guard let result = result else { return print("Ошибка парсинга") }
            return completion(result)
        }.resume()

    }
}
