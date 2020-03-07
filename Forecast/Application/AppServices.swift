//
//  AppServices.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppServices: ViewModifier {
    private static var appState: AppState = AppState()
    private static var visualState: VisualState = VisualState()
    private static var locationPickerState: LocationPickerState = LocationPickerState()
    private static var settingsSheetState: SettingsSheetState = SettingsSheetState()

    private static var weatherService: WeatherService = WeatherService()
    private static var locationService: LocationService = LocationService()
    private static var locationSearchService: LocationSearchService = LocationSearchService()
    private static var locationFavoritesService: LocationFavoritesService = LocationFavoritesService()

    func body(content: Content) -> some View {
        content
            .colorScheme(.dark)
            .environmentObject(Self.appState)
            .environmentObject(Self.visualState)
            .environmentObject(Self.locationPickerState)
            .environmentObject(Self.settingsSheetState)
            .environmentObject(Self.weatherService)
            .environmentObject(Self.locationService)
            .environmentObject(Self.locationSearchService)
            .environmentObject(Self.locationFavoritesService)

            .modifier(WeatherToLocationBinder(
                weatherService: Self.weatherService,
                locationService: Self.locationService,
                locationFavoritesService: Self.locationFavoritesService
            ))
            .modifier(VisualStateToAppStateAndWeatherBinder(
                appState: Self.appState,
                visualState: Self.visualState,
                weatherService: Self.weatherService
            ))
    }
}
