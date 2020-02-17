//
//  LocationItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FavoriteLocationItem: View {
    @EnvironmentObject private var provider: WeatherProvider

    let icon: String
    let location: Location

    var body: some View {
        HStack(alignment: .center, spacing: Dimension.Spacing.barItems) {
            Image(systemName: icon)
                .font(Font.callout.weight(.bold))

            VStack(alignment: .leading, spacing: 0) {
                Text(location.name)
                    .font(Font.callout.weight(.bold))

                Text(location.regionName)
                    .font(Font.caption.bold())
                    .foregroundColor(Color.primary.opacity(0.6))
            }

            Spacer()

            Text(temperatureLabelText ?? .empty)
                .font(Font.title.bold())
        }
        .padding(.horizontal, 20)
        .frame(height: 57)
        .background(color)
        .cornerRadius(14)
    }

    private var temperatureLabelText: String? {
        guard let temperature = matchingLocation?.temperature else {
            return nil
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

struct FavoriteLocationItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteLocationItem(
            icon: "location.fill",
            location: Location(
                name: "Ottawa",
                regionName: "ON, Canada",
                coordinate: .init(latitude: 0.0, longitude: 0.0)
            )
        )
    }
}
