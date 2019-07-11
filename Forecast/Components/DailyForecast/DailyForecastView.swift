//
//  DailyForecastView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DailyForecastView: View {
    let item: DailyForecastItem

    var body: some View {
        HStack(alignment: .center, spacing: 18) {
            ForecastWeatherIcon(name: item.symbolName)

            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .firstTextBaseline, spacing: 18) {
                    Text(item.title)

                    Spacer()

                    HStack(alignment: .firstTextBaseline, spacing: 2) {
                        Text("\(item.temperature)")
                        Text("°\(item.temperatureUnits)")
                            .color(Color.primary.opacity(0.65))
                    }
                }
                .font(Font.system(size: 18).weight(.semibold))

                HStack(alignment: .firstTextBaseline, spacing: 18) {
                    Text(item.description)
                        .font(Font.system(size: 12).weight(.heavy))
                        .color(Color.primary.opacity(0.65))

                    renderPopLabel()
                }
            }
        }
    }

    private func renderPopLabel() -> Group<TupleView<(Spacer, PopLabel)>>? {
        guard let pop = item.pop else {
            return nil
        }

        return Group {
            Spacer()
            PopLabel(pop: pop)
        }
    }
}

#if DEBUG
struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastView(
            item: DailyForecastItem(
                title: "Monday",
                description: "Cloudy with 60% chance of showers",
                temperature: 25,
                temperatureUnits: "C",
                symbolName: "cloud.sun.fill"
            )
        )
    }
}
#endif
