//
//  CloudsWidgetEntryView.swift
//  CloudsWidgetExtension
//
//  Created by Lukas Romsicki on 2020-11-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import WidgetKit

struct CloudsWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(gradient: Gradient(colors: gradientSteps), startPoint: .top, endPoint: .bottom)

            if image != nil {
                Color.clear.background(image!
                    .resizable()
                    .offset(x: 10, y: -55)
                    .aspectRatio(contentMode: .fill))
            }

            VStack(alignment: .leading, spacing: 0) {
                if temperature != nil {
                    Text("\(temperature!)°")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }

                Text(entry.description ?? "No weather data")
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .padding()
        }
        .colorScheme(.dark)
    }

    private var gradientSteps: [Color] {
        [
            WeatherColorScheme[entry.colorScheme].upper,
            WeatherColorScheme[entry.colorScheme].lower
        ]
    }

    private var image: Image? {
        WeatherImageStyle[entry.iconStyle, entry.colorScheme ?? .empty]
    }

    private var temperature: String? {
        guard let temperature = entry.temperature else {
            return nil
        }

        return "\(Int(temperature.rounded() + 0.0))"
    }
}

struct CloudsWidget_Previews: PreviewProvider {
    static var previews: some View {
        CloudsWidgetEntryView(
            entry: WeatherEntry(
                date: Date(),
                iconStyle: .partlyCloudy,
                colorScheme: .empty,
                temperature: 21,
                description: "Light rain"
            )
        )
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
