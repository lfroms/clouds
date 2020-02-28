//
//  LocationItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FavoriteLocationItem: View {
    @EnvironmentObject private var weatherProvider: WeatherProvider
    @EnvironmentObject private var appState: AppState

    let location: Location

    var body: some View {
        LocationItemContainer(color: color, action: onPressAction) {
            LocationItemStarButton(isHighlighted: true, monochrome: true, onPressAction: self.removeFromFavorites)
            LocationItemLabels(title: self.location.name, subtitle: self.location.regionName)
            Spacer()
            LocationItemTemperature(text: self.temperatureLabelText)
        }
    }

    private var temperatureLabelText: String {
        guard let temperature = matchingLocation?.temperature else {
            return .empty
        }

        return "\(Int(temperature.rounded() + 0.0))°"
    }

    private var matchingLocation: ShortFormWeather? {
        weatherProvider.favoriteLocations.first(where: { item in
            item.coordinate == location.coordinate
        })
    }

    private static let colorPrefix = "color"

    private var color: Color? {
        guard let colorCode = colorCode else {
            return nil
        }

        return Color("\(Self.colorPrefix)-\(colorCode)-low")
    }

    private var colorCode: Int? {
        matchingLocation?.iconCode
    }

    private func onPressAction() {
        appState.toggleLocationPicker(animated: true)

        UserSettings.saveActiveLocation(location: location)
        weatherProvider.fetchData()
    }

    private func removeFromFavorites() {
        if appState.favoriteLocations.contains(location) {
            appState.favoriteLocations.removeAll { $0 == location }

            return
        }
    }
}

struct FavoriteLocationItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteLocationItem(
            location: Location(
                name: "Ottawa",
                regionName: "ON, Canada",
                coordinate: .init(latitude: 0.0, longitude: 0.0)
            )
        )
    }
}
