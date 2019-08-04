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
        VStack(alignment: .center, spacing: 14) {
            VStack(spacing: 24) {
                HStack(alignment: .firstTextBaseline, spacing: 2) {
                    FixedSizeText("\(viewModel.date.toFormat("h"))")
                    FixedSizeText("\(viewModel.date.toFormat("a").lowercased())")
                        .foregroundColor(Color.primary.opacity(0.65))
                }
                .font(Font.system(size: 14).weight(.heavy))

                ForecastWeatherIcon(name: viewModel.symbolName)

                HStack(alignment: .firstTextBaseline, spacing: 2) {
                    FixedSizeText("\(viewModel.temperature)")
                    FixedSizeText("°\(viewModel.temperatureUnits)")
                        .foregroundColor(Color.primary.opacity(0.64))
                }
                .font(Font.system(size: 18).weight(.bold))
            }

            VStack(spacing: 6) {
                FixedSizeText(getWindSpeedText())
                    .foregroundColor(Color.primary.opacity(0.65))
                renderPopLabel()
            }
            .font(Font.system(size: 12).weight(.heavy))
        }
    }

    private func FixedSizeText(_ text: String) -> some View {
        Text(text)
            .lineLimit(1)
            .fixedSize()
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
