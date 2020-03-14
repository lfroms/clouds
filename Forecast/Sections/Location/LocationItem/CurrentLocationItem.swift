//
//  LocationItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentLocationItem: View {
    @EnvironmentObject private var locationPickerState: LocationPickerState
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService

    let icon: String
    let location: Location

    var body: some View {
        LocationItemContainer(color: color, action: onPressAction) {
            LocationItemIcon(name: self.icon)
            LocationItemLabels(title: self.location.name, subtitle: self.location.regionName)
            Spacer()
            LocationItemTemperature(text: self.temperatureLabelText)
        }
    }

    private var temperatureLabelText: String {
        guard let temperature = weatherService.currentLocation?.currentConditions?.temperature else {
            return .empty
        }

        return "\(Int(temperature.rounded() + 0.0))°"
    }

    private static let colorPrefix = "color"

    private var color: Color? {
        guard let colorCode = colorCode else {
            return nil
        }

        return Color("\(Self.colorPrefix)-\(colorCode)-low")
    }

    private var colorCode: Int? {
        weatherService.currentLocation?.currentConditions?.iconCode
    }

    private func onPressAction() {
        locationPickerState.toggleLocationPicker(animated: true)

        locationFavoritesService.clearActiveLocation()
        weatherService.setShouldFetchUpdatedWeather()
    }
}

struct CurrentLocationItem_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationItem(
            icon: "location.fill",
            location: Location(
                id: UUID(),
                name: "Ottawa",
                regionName: "ON, Canada",
                coordinate: .init(latitude: 0.0, longitude: 0.0)
            )
        )
    }
}
