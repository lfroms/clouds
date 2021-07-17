//
//  MeasurementGridContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-05.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CloudsAPI
import SwiftUI

struct MeasurementGridContainer: Container {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var weatherService: WeatherService

    var body: some View {
        Group {
            if self.measurements.count > 0 {
                MeasurementGrid(
                    measurements: self.measurements,
                    didCalculateHeight: self.didCalculateHeight
                )
                .equatable()
            }
        }
    }

    private func didCalculateHeight(height: CGFloat) {
        appState.detailsContentHeight = height
    }

    private var measurements: [MeasurementDescriptor] {
        guard let currentConditions = weatherService.weather?.currently else {
            return []
        }

        var observations = [MeasurementDescriptor]()

        // MARK: - Humidity 💧

        if let humidity = currentConditions.humidity {
            let item = MeasurementDescriptor(
                label: "Humidity",
                value: "\(Int(humidity * 100))%",
                color: .blue
            )

            observations.append(item)
        }

        // MARK: - Atmospheric Pressure 📈

        if let pressure = currentConditions.pressure.value, let tendency = currentConditions.pressure.tendency {
            let tendencyArrow = arrow(for: tendency)

            let item = MeasurementDescriptor(
                label: "Pressure",
                value: "\(pressure) kPa\(tendencyArrow)",
                color: .green
            )

            observations.append(item)
        }

        // MARK: - Feels Like ☀️❄️

        if let feelsLikeTemperature = currentConditions.feelsLike.temperature, let feelsLikeType = currentConditions.feelsLike.type {
            let label = feelsLikeType == .humidex ? "Humidex" : "Wind Chill"
            let color: Color = feelsLikeType == .humidex ? .orange : .blue

            let item = MeasurementDescriptor(
                label: label,
                value: "\(feelsLikeTemperature) °C",
                color: color
            )

            observations.append(item)
        }

        // MARK: - Wind 💨

        if let windSpeed = currentConditions.wind.speed {
            let item = MeasurementDescriptor(
                label: "Wind",
                value: "\(windSpeed) km/h",
                color: .red,
                prefix: currentConditions.wind.direction
            )

            observations.append(item)
        }

        if let windGust = currentConditions.wind.gust {
            let item = MeasurementDescriptor(
                label: "Wind Gust",
                value: "\(windGust) km/h",
                color: .pink
            )

            observations.append(item)
        }

        // MARK: - Visibility 📏

        if let visibility = currentConditions.visibility {
            let item = MeasurementDescriptor(
                label: "Visibility",
                value: "\(visibility) km",
                color: .green
            )

            observations.append(item)
        }

        // MARK: - Dew Point 🌡

        if let dewPoint = currentConditions.dewPoint {
            let item = MeasurementDescriptor(
                label: "Dew Point",
                value: "\(dewPoint) °C",
                color: .blue
            )

            observations.append(item)
        }

        return observations
    }

    private func arrow(for tendency: CloudsAPI.Tendency) -> String {
        switch tendency {
        case .rising:
            return " ↑"
        case .falling:
            return " ↓"
        default:
            return ""
        }
    }
}

struct MeasurementGridContainer_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementGridContainer()
    }
}
