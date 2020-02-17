//
//  LocationItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentLocationItem: View {
    @EnvironmentObject private var provider: FavoritesWeatherProvider

    let icon: String
    let location: Location

    var body: some View {
        LocationItemContainer(color: color) {
            LocationItemIcon(name: self.icon)
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

    private var matchingLocation: FavoriteLocationWeather? {
        provider.favoriteLocationsWeather.first(where: { item in
            item.coordinate == location.coordinate
        })
    }

    private static let colorPrefix = "color"

    private var color: Color {
        guard let colorCode = colorCode else {
            return Color(white: 0.23)
        }

        return Color("\(Self.colorPrefix)-\(colorCode)-low")
    }

    private var colorCode: Int? {
        matchingLocation?.iconCode
    }
}

struct CurrentLocationItem_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationItem(
            icon: "location.fill",
            location: Location(
                name: "Ottawa",
                regionName: "ON, Canada",
                coordinate: .init(latitude: 0.0, longitude: 0.0)
            )
        )
    }
}
