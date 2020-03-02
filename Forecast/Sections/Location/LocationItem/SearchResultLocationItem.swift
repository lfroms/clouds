//
//  SearchResultLocationItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-27.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchResultLocationItem: View {
    @EnvironmentObject private var weatherProvider: WeatherProvider
    @EnvironmentObject private var appState: AppState

    let location: Location

    var body: some View {
        LocationItemContainer(action: onPressAction) {
            LocationItemIcon(name: "map.fill")
            LocationItemLabels(title: self.location.name, subtitle: self.location.regionName)
            Spacer()
            LocationItemStarButton(isHighlighted: self.isFavorite, onPressAction: self.toggleFavorite)
        }
    }

    private func onPressAction() {
        appState.toggleLocationPicker(animated: true)

        UserSettings.saveActiveLocation(location: location)
        weatherProvider.fetchDataWithDelay()
    }

    private var isFavorite: Bool {
        appState.favoriteLocations.contains(location)
    }

    private func toggleFavorite() {
        if appState.favoriteLocations.contains(location) {
            appState.favoriteLocations.removeAll { $0 == location }

            return
        }

        appState.favoriteLocations.append(location)
    }
}

struct SearchResultLocationItem_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultLocationItem(
            location: Location(
                name: "Ottawa",
                regionName: "ON, Canada",
                coordinate: .init(latitude: 0.0, longitude: 0.0)
            )
        )
    }
}
