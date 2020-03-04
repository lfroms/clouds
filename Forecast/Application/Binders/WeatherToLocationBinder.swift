//
//  WeatherToLocationBinder.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

struct WeatherToLocationBinder: ViewModifier {
    private var weatherService: WeatherService
    private var locationService: LocationService
    private var locationFavoritesService: LocationFavoritesService

    private lazy var locationChangedCancellable: AnyCancellable? = nil
    private lazy var shouldLoadWeatherCancellable: AnyCancellable? = nil

    init(weatherService: WeatherService, locationService: LocationService, locationFavoritesService: LocationFavoritesService) {
        self.weatherService = weatherService
        self.locationService = locationService
        self.locationFavoritesService = locationFavoritesService

        locationChangedCancellable =
            locationService.locationDidChange
                .debounce(for: .seconds(1), scheduler: RunLoop.main)
                .subscribe(on: RunLoop.main)
                .sink(receiveValue: fetchWeather)

        shouldLoadWeatherCancellable = weatherService.shouldLoadUpdatedWeather.sink(receiveValue: fetchWeather)
    }

    func body(content: Content) -> some View {
        content
            .onAppear(perform: observeAppForegroundNotification)
    }

    // MARK: - Binding Functions

    private func fetchWeather() {
        weatherService.fetchData(
            currentLocation: locationService.lastLocation?.coordinate,
            activeLocation: locationFavoritesService.getActiveLocation()?.coordinate,
            favoriteLocations: locationFavoritesService.getFavoriteLocations().compactMap { $0.coordinate }
        )
    }

    // MARK: - Notifications

    private func observeAppForegroundNotification() {
        NotificationCenter.default.addObserver(
            forName: UIApplication.willEnterForegroundNotification,
            object: nil,
            queue: nil,
            using: fetchFromNotification
        )
    }

    private func fetchFromNotification(_: Notification) {
        fetchWeather()
    }
}
