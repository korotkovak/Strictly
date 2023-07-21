//
//  Strictly_widgetBundle.swift
//  Strictly widget
//
//  Created by Kristina Korotkova on 21/07/23.
//

import WidgetKit
import SwiftUI

@main
struct Strictly_widgetBundle: WidgetBundle {
    var body: some Widget {
        WidgetRUBtoUSD()
        WidgetRUBtoEUR()
        WidgetRUBtoAED()
    }
}
