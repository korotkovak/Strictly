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
            let entry = WidgetEntry(
                date: Date(),
                data: data
            )
            completion(entry)
        }
    }

    func getTimeline(
        in context: Context,
        completion: @escaping (Timeline<WidgetEntry>) -> ()
    ) {
        guard let targetDate = Calendar.current.date(
            byAdding: .second,
            value: 60,
            to: Date()
        ) else { return print("Неверная дата")}

        viewModel.networkService.getExchangeRates(from: сurrency) { data in
            let timeline = Timeline(
                entries: [
                    WidgetEntry(
                        date: Date(),
                        data: data
                    )
                ],
                policy: .after(targetDate)
            )
            completion(timeline)
        }
    }
}
