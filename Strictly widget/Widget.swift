//
//  Widget.swift
//  Strictly widgetExtension
//
//  Created by Kristina Korotkova on 21/07/23.
//

import WidgetKit
import SwiftUI

struct WidgetRUBtoUSD: Widget {
    let kind: String = "WidgetRUBtoUSD"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider(from: "USD")
        ) { entry in
            WidgetView(entry: entry)
        }
        .configurationDisplayName(Constants.displayName)
        .description(Constants.description)
        .supportedFamilies([.systemSmall])
    }
}

struct WidgetRUBtoEUR: Widget {
    let kind: String = "WidgetRUBtoEUR"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider(from: "EUR")
        ) { entry in
            WidgetView(entry: entry)
        }
        .configurationDisplayName(Constants.displayName)
        .description(Constants.description)
        .supportedFamilies([.systemSmall])
    }
}

struct WidgetRUBtoAED: Widget {
    let kind: String = "WidgetRUBtoAED"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider(from: "AED")
        ) { entry in
            WidgetView(entry: entry)
        }
        .configurationDisplayName(Constants.displayName)
        .description(Constants.description)
        .supportedFamilies([.systemSmall])
    }
}

struct Widget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: WidgetEntry(date: Date(), data: nil))
        .previewContext(WidgetPreviewContext(family: .systemSmall))
        .environment(\.colorScheme, .light)
        //            .redacted(reason: .placeholder)
    }
}

// MARK: - Constants

fileprivate enum Constants {
    static let displayName = "Strictly widget"
    static let description = "Watch the exchange rate and its changes during the day"
}
