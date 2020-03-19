//
//  MeasurementGridContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-05.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MeasurementGridContainer: View {
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
        guard let units = weatherService.activeLocation?.units, let cc = weatherService.activeLocation?.currentConditions else {
            return []
        }
        
        var observations = [MeasurementDescriptor]()
        
        // MARK: - Humidity 💧
        
        if let humidity = cc.humidity {
            let item = MeasurementDescriptor(
                label: "Humidity",
                value: "\(humidity)%",
                color: .blue
            )
            
            observations.append(item)
        }
        
        // MARK: - Atmospheric Pressure 📈
        
        if let pressure = cc.pressure {
            let item = MeasurementDescriptor(
                label: "Pressure",
                value: "\(pressure) \(units.pressure)",
                color: .green
            )
            
            observations.append(item)
        }
        
        // MARK: - Wind Chill ❄️
        
        if let windChill = cc.windChill {
            let item = MeasurementDescriptor(
                label: "Wind Chill",
                value: "\(windChill) °\(units.temperature)",
                color: .blue
            )
            
            observations.append(item)
        }
        
        // MARK: - Humidex ☀️
        
        if let humidex = cc.humidex {
            let item = MeasurementDescriptor(
                label: "Humidex",
                value: "\(humidex) °\(units.temperature)",
                color: .orange
            )
            
            observations.append(item)
        }
        
        // MARK: - Wind 💨
        
        if let wind = cc.wind, let speed = wind.speed {
            let item = MeasurementDescriptor(
                label: "Wind",
                value: "\(speed) \(units.speed)",
                color: .red,
                prefix: wind.direction
            )
            
            observations.append(item)
        }
        
        if let gust = cc.wind?.gust {
            let item = MeasurementDescriptor(
                label: "Wind Gust",
                value: "\(gust) \(units.speed)",
                color: .pink
            )
            
            observations.append(item)
        }
        
        // MARK: - Visibility 📏
        
        if let visibility = cc.visibility {
            let item = MeasurementDescriptor(
                label: "Visibility",
                value: "\(visibility) \(units.distance)",
                color: .green
            )
            
            observations.append(item)
        }
        
        // MARK: - Dewpoint 🌡
        
        if let dewPoint = cc.dewPoint {
            let item = MeasurementDescriptor(
                label: "Dewpoint",
                value: "\(dewPoint) °\(units.temperature)",
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
