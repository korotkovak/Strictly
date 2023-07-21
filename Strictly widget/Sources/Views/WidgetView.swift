//
//  WidgetView.swift
//  Strictly widgetExtension
//
//  Created by Kristina Korotkova on 21/07/23.
//

import SwiftUI
import WidgetKit

struct WidgetView: View {
    var entry: WidgetEntry
    @Environment(\.redactionReasons) private var reasons

    var body: some View {
        if reasons.isEmpty {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 155, height: 155)
                    .background(.white)
                    .cornerRadius(22)
                VStack(alignment: .leading) {
                    HStack(spacing: 12) {
                        Image("img_flag_\(entry.data?.base ?? "USD")")
                            .frame(width: 32, height: 24)
                            .cornerRadius(4)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(entry.data?.base ?? "USD")
                                .font(Font.system(size: 12).bold())
                                .foregroundColor(Color(red: 0.26, green: 0.26, blue: 0.26))
                            Text("24 hours")
                                .font(Font.system(size: 10))
                                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    }

                    Spacer()

                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 0) {
                            Text(
                                formattedNumber(
                                    Double(entry.data?.result.values.first ?? 0.0)
                                )
                            )
                            .font(Font.system(size: 36))
                            Image("img_signs_RUB")
                                .frame(width: 16, height: 28)
                                .padding(.top, 5)
                        }
                        Text("—")
                            .font(Font.system(size: 14).bold())
                            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
            }
        } else {
            PlaceholderView()
        }
    }
}

extension WidgetView {
    private func formattedNumber(_ number: Double) -> AttributedString {
        let numberString = String(format: "%.2f", number)

        let attributedString = NSMutableAttributedString(string: numberString)
        let decimalRange = NSRange(location: numberString.count - 2, length: 2)

        attributedString.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 26),
            range: decimalRange
        )

        return AttributedString(attributedString)
    }
}
