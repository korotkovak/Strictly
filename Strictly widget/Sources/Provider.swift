//
//  Provider.swift
//  Strictly widgetExtension
//
//  Created by Kristina Korotkova on 21/07/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    @ObservedObject var viewModel: ExchangeRatesViewModel
    let сurrency: String

    init(from сurrency: String) {
        self.сurrency = сurrency
        self.viewModel = ExchangeRatesViewModel()
    }

    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date(), data: nil)
    }

    func getSnapshot(
        in context: Context,
        completion: @escaping (WidgetEntry) -> ()
    ) {
        viewModel.networkService.getExchangeRates(from: сurrency) { data in
            let entry = WidgetEntry(date: .now, data: data)
            completion(entry)
        }
    }

    func getTimeline(
        in context: Context,
        completion: @escaping (Timeline<WidgetEntry>) -> ()
    ) {
        viewModel.networkService.getExchangeRates(from: сurrency) { data in
            let entry = WidgetEntry(date: .now, data: data)
            let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 1, to: .now) ?? Date()
            let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
            completion(timeline)
        }
    }
}
