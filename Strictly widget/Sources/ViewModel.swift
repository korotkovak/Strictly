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
    @Published var localStorage: LocalStorageType?
    let networkService = NetworkService()

//    let cachedData = UserDefaults.standard.value(forKey: "ExchangeRates")

//    var volatility: Float {
//        let cachedData = localStorage?.fetchValue(type: Float.self, for: "ExchangeRates")
//        print(cachedData)
//        let currentСourse = model?.result.first?.value
//
//        guard let cachedData = cachedData,
//              let currentСourse = currentСourse
//        else { return 0.0 }
//        
//        return cachedData - currentСourse
//    }
}
