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
                    locationWeather: weatherService.currentLocationShortForm,
                    loading: .constant(weatherService.loading),
                    onSelectLocation: didSelect(location:)
                )
                .equatable()
            }
        }
    }

    private var currentLocation: Location? {
        guard
            let lastPlacemark = locationService.lastPlacemark,
            let cityName = lastPlacemark.locality,
            let coordinate = locationService.lastLocation?.coordinate
        else {
            return nil
        }

        let regionName = LocationNameHelper.shared.createRegionNameFrom(placemark: lastPlacemark)
        return Location(name: cityName, regionName: regionName, coordinate: coordinate)
    }

    private func didSelect(location: Location) {
        locationPickerState.toggleLocationPicker(animated: true)

        locationFavoritesService.clearActiveLocation()
        weatherService.setShouldFetchUpdatedWeather()
    }
}

struct CurrentLocationGroupContainer_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationGroupContainer()
    }
}