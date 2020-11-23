//
//  CloudsWidget.swift
//  CloudsWidget
//
//  Created by Lukas Romsicki on 2020-11-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import WidgetKit

@main
struct CloudsWidget: Widget {
    let kind: String = "CloudsWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CloudsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Current Location")
        .description("Weather conditions for your current location.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
