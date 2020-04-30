//
//  MeasurementGridContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-05.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

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
        self.appState.detailsContentHeight = height
    }
    
    private var measurements: [MeasurementDescriptor] {
        guard let cc = weatherService.weather?.currently else {
            return []
        }
        
        var observations = [MeasurementDescriptor]()
        
        // MARK: - Humidity 💧
        
        if let humidity = cc.humidity {
            let item = MeasurementDescriptor(
                label: "Humidity",
                value: "\(Int(humidity * 100))%",
                color: .blue
            )
            
            observations.append(item)
        }
        
        // MARK: - Atmospheric Pressure 📈
        
        if let pressure = cc.pressure.value {
            let item = MeasurementDescriptor(
                label: "Pressure",
                value: "\(pressure) kPa",
                color: .green
            )
            
            observations.append(item)
        }
        
        // MARK: - Feels Like ☀️❄️
        
        if let feelsLikeTemperature = cc.feelsLike.temperature, let feelsLikeType = cc.feelsLike.type {
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
        
        if let windSpeed = cc.wind.speed {
            let item = MeasurementDescriptor(
                label: "Wind",
                value: "\(windSpeed) km/h",
                color: .red,
                prefix: cc.wind.direction
            )
            
            observations.append(item)
        }
        
        if let windGust = cc.wind.gust {
            let item = MeasurementDescriptor(
                label: "Wind Gust",
                value: "\(windGust) km/h",
                color: .pink
            )
            
            observations.append(item)
        }
        
        // MARK: - Visibility 📏
        
        if let visibility = cc.visibility {
            let item = MeasurementDescriptor(
                label: "Visibility",
                value: "\(visibility) km",
                color: .green
            )
            
            observations.append(item)
        }
        
        // MARK: - Dew Point 🌡
        
        if let dewPoint = cc.dewPoint {
            let item = MeasurementDescriptor(
                label: "Dew Point",
                value: "\(dewPoint) °C",
                color: .blue
            )
            
            observations.append(item)
        }
        
        return observations
    }
}

struct MeasurementGridContainer_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementGridContainer()
    }
}
