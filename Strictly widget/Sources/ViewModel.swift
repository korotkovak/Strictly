//
//  ViewModel.swift
//  Strictly widgetExtension
//
//  Created by Kristina Korotkova on 21/07/23.
//

import SwiftUI
import WidgetKit

class ExchangeRatesViewModel: ObservableObject {
    @Published var model: ExchangeRates? {
        didSet {
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
    let networkService = NetworkService()
}
