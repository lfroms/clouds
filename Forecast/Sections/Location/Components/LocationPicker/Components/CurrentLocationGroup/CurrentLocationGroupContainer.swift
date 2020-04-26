//
//  CurrentLocationGroupContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentLocationGroupContainer: Container {
    @EnvironmentObject private var locationPickerState: LocationPickerState
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var locationService: LocationService

    var body: some View {
        Group {
            if currentLocation != nil {
                CurrentLocationGroup(
                    location: currentLocation!,
                    loading: .constant(weatherService.loading),
                    onSelectLocation: didSelect(location:)
                )
                .equatable()
            }
        }
    }

    private var currentLocation: StoredLocation? {
        guard
            let lastPlacemark = locationService.lastPlacemark,
            let cityName = lastPlacemark.locality,
            let coordinate = locationService.lastLocation?.coordinate
        else {
            return nil
        }

        var components: [String] = []

        if let administrativeArea = lastPlacemark.administrativeArea {
            components.append(administrativeArea)
        }

        if let country = lastPlacemark.country {
            components.append(country)
        }

        let regionName = components.joined(separator: ", ")

        return StoredLocation(name: cityName, regionName: regionName, coordinate: coordinate)
    }

    private func didSelect(location: StoredLocation) {
        locationPickerState.toggleLocationPicker(animated: true)

        guard locationFavoritesService.activeLocation != nil else {
            return
        }

        locationFavoritesService.clearActiveLocation()
        weatherService.setShouldFetchUpdatedWeather()
    }
}

struct CurrentLocationGroupContainer_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationGroupContainer()
    }
}
