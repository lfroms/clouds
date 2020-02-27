//
//  CurrentConditionsView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

struct CurrentConditionsItemDescriptor: Identifiable {
    let id = UUID()
    
    let label: String
    let value: String
    let color: Color
    var prefix: String?
}

struct CurrentConditionsView: View {
    @EnvironmentObject private var provider: WeatherProvider
    @EnvironmentObject private var appState: AppState
    
    private typealias ConditionPair = (CurrentConditionsItemDescriptor, CurrentConditionsItemDescriptor)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 22) {
            ForEach(conditionPairs, id: \.0.id) { left, right in
                HStack(spacing: 0) {
                    HStack {
                        CurrentConditionsItem(
                            label: left.label,
                            value: left.value,
                            color: left.color,
                            prefix: left.prefix
                        )
                        Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                    HStack {
                        CurrentConditionsItem(
                            label: right.label,
                            value: right.value,
                            color: right.color,
                            prefix: right.prefix
                        )
                        Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
            }
        }
        .padding(30)
        .onReceive(self.provider.objectWillChange, perform: { _ in
            self.calculateAndSetHeight()
        })
    }
    
    private var conditionPairs: [ConditionPair] {
        stride(from: 0, to: observations.count - 1, by: 2).map {
            (observations[$0], observations[$0 + 1])
        }
    }
    
    private func calculateAndSetHeight() {
        // TODO: - Remove hardcoded values
        appState.detailsContentHeight = CGFloat((conditionPairs.count * 50) + 30 + 30 + ((conditionPairs.count - 1) * 22))
    }
    
    var observations: [CurrentConditionsItemDescriptor] {
        guard let units = provider.activeLocation?.units, let cc = provider.activeLocation?.currentConditions else {
            return []
        }
        
        var observations = [CurrentConditionsItemDescriptor]()
        
        // MARK: - Humidity 💧
        
        if let humidity = cc.humidity {
            let item = CurrentConditionsItemDescriptor(
                label: "Humidity",
                value: "\(humidity)%",
                color: .red
            )
            
            observations.append(item)
        }
        
        // MARK: - Atmospheric Pressure 📈
        
        if let pressure = cc.pressure {
            let item = CurrentConditionsItemDescriptor(
                label: "Pressure",
                value: "\(pressure) \(units.pressure)",
                color: .blue
            )
            
            observations.append(item)
        }
        
        // MARK: - Wind Chill ❄️
        
        if let windChill = cc.windChill {
            let item = CurrentConditionsItemDescriptor(
                label: "Wind Chill",
                value: "\(windChill) °\(units.temperature)",
                color: .green
            )
            
            observations.append(item)
        }
        
        // MARK: - Humidex ☀️
        
        if let humidex = cc.humidex {
            let item = CurrentConditionsItemDescriptor(
                label: "Humidex",
                value: "\(humidex) °\(units.temperature)",
                color: .orange
            )
            
            observations.append(item)
        }
        
        // MARK: - Wind 💨
        
        if let wind = cc.wind, let speed = wind.speed {
            let item = CurrentConditionsItemDescriptor(
                label: "Wind",
                value: "\(speed) \(units.speed)",
                color: .blue,
                prefix: wind.direction
            )
            
            observations.append(item)
        }
        
        if let gust = cc.wind?.gust {
            let item = CurrentConditionsItemDescriptor(
                label: "Wind Gust",
                value: "\(gust) \(units.speed)",
                color: .pink
            )
            
            observations.append(item)
        }
        
        // MARK: - Visibility 📏
        
        if let visibility = cc.visibility {
            let item = CurrentConditionsItemDescriptor(
                label: "Visibility",
                value: "\(visibility) \(units.distance)",
                color: .green
            )
            
            observations.append(item)
        }
        
        // MARK: - Dewpoint 🌡
        
        if let dewPoint = cc.dewPoint {
            let item = CurrentConditionsItemDescriptor(
                label: "Dewpoint",
                value: "\(dewPoint) °\(units.temperature)",
                color: .red
            )
            
            observations.append(item)
        }
        
        return observations
    }
}

struct CurrentConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentConditionsView()
    }
}
