//
//  ViewModel.swift
//  Strictly widgetExtension
//
//  Created by Kristina Korotkova on 21/07/23.
//

import SwiftUI
import WidgetKit

class ExchangeRatesViewModel: ObservableObject {
    @Published var model: ExchangeRates?
    let networkService = NetworkService()

    let initialUSD: Float = 90.48512
    let initialEUR: Float = 110.66728
    let initialAED: Float = 24.79884

    func calculateVolatility(initialRate: Float, currentRate: Float) -> Float {
        let volatility = ((currentRate - initialRate) / initialRate) * 100
        return volatility
    }
}
