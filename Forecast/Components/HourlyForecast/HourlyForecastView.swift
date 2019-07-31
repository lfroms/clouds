//
//  HourlyForecastView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct HourlyForecastView: View {
    let viewModel: HourlyForecastViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 18) {
            VStack(spacing: 26) {
                HStack(alignment: .firstTextBaseline, spacing: 2) {
                    Text("\(viewModel.date.toFormat("h"))")
                    Text("\(viewModel.date.toFormat("a").lowercased())")
                        .color(Color.primary.opacity(0.65))
                }
                .font(Font.system(size: 14).weight(.heavy))

                ForecastWeatherIcon(name: viewModel.symbolName)

                HStack(alignment: .firstTextBaseline, spacing: 2) {
                    Text("\(viewModel.temperature)")
                    Text("°\(viewModel.temperatureUnits)")
                        .color(Color.primary.opacity(0.64))
                }
                .font(Font.system(size: 16).weight(.bold))
            }

            VStack(spacing: 10) {
                Text(getWindSpeedText())
                    .color(Color.primary.opacity(0.65))
                renderPopLabel()
            }
            .font(Font.system(size: 12).weight(.heavy))
        }
    }

    private func getWindSpeedText() -> String {
        if let windSpeed = viewModel.windSpeed {
            return "\(windSpeed) \(viewModel.windSpeedUnits)"
        }

        return "Calm"
    }

    private func renderPopLabel() -> PopLabel? {
        guard let pop = viewModel.pop else {
            return nil
        }

        return PopLabel(pop: pop)
    }

    enum AmPm: String {
        case am
        case pm
    }
}

#if DEBUG
struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView(
            viewModel: HourlyForecastViewModel(
                date: DateInRegion(),
                symbolName: "cloud.rain.fill",
                temperature: 24,
                temperatureUnits: "C",
                windSpeedUnits: "km/h",
                windSpeed: 32,
                pop: 54
            )
        )
    }
}
#endif
