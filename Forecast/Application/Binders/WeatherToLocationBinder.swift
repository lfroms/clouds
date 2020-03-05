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
    private lazy var didBecomeActiveCancellable: AnyCancellable? = nil
    private lazy var willResignActiveCancellable: AnyCancellable? = nil

    init(weatherService: WeatherService, locationService: LocationService, locationFavoritesService: LocationFavoritesService) {
        self.weatherService = weatherService
        self.locationService = locationService
        self.locationFavoritesService = locationFavoritesService

        locationChangedCancellable = locationService.locationDidChange
            .debounce(for: .seconds(0.3), scheduler: RunLoop.main)
            .sink(receiveValue: fetchWeather)

        shouldLoadWeatherCancellable = weatherService.shouldLoadUpdatedWeather.sink(receiveValue: fetchWeather)

        didBecomeActiveCancellable = NotificationCenter.default
            .publisher(for: UIApplication.didBecomeActiveNotification)
            .sink(receiveValue: didBecomeActive)

        willResignActiveCancellable = NotificationCenter.default
            .publisher(for: UIApplication.willResignActiveNotification)
            .sink(receiveValue: willResignActive)
    }

    func body(content: Content) -> some View {
        content
    }

    // MARK: - Binding Functions

    private func fetchWeather() {
        weatherService.fetchData(
            currentLocation: locationService.lastLocation?.coordinate,
            activeLocation: locationFavoritesService.getActiveLocation()?.coordinate,
            favoriteLocations: locationFavoritesService.getFavoriteLocations().compactMap { $0.coordinate }
        )
    }

    private func didBecomeActive(_: Notification) {
        locationService.startUpdatingLocation()

        if locationService.locationStatus != .authorizedWhenInUse {
            fetchWeather()
        }
    }

    private func willResignActive(_: Notification) {
        locationService.stopUpdatingLocation()
    }
}
