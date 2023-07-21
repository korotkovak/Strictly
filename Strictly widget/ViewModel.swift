//
//  ViewModel.swift
//  Strictly widgetExtension
//
//  Created by Kristina Korotkova on 21/07/23.
//

import SwiftUI

class ExchangeRatesViewModel: ObservableObject {
    @Published var model: ExchangeRates?
    let networkService = NetworkService()
}
