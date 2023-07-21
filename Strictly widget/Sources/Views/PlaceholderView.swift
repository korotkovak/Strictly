//
//  PlaceholderView.swift
//  Strictly widgetExtension
//
//  Created by Kristina Korotkova on 22/07/23.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 155, height: 155)
                .background(.white)
                .cornerRadius(22)
            VStack(alignment: .leading) {
                HStack(spacing: 12) {
                    Image("img_flag_Zero")
                        .frame(width: 32, height: 24)
                        .cornerRadius(4)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 32, height: 10)
                        .background(Color(red: 0.82, green: 0.84, blue: 0.83))
                        .cornerRadius(12)
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)

                Spacer()

                VStack(alignment: .leading, spacing: 14) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 84, height: 24)
                        .background(Color(red: 0.82, green: 0.84, blue: 0.83))
                        .cornerRadius(12)

                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 32, height: 12)
                        .background(Color(red: 0.82, green: 0.84, blue: 0.83))
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
    }
}
