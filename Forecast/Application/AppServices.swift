//
//  AppServices.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppServices: ViewModifier {
    private static let appState: AppState = AppState()
    private static let visualState: VisualState = VisualState()
    private static let weekSectionState: WeekSectionState = WeekSectionState()
    private static let locationPickerState: LocationPickerState = LocationPickerState()
    private static let settingsSheetState: SettingsSheetState = SettingsSheetState()

    private static let weatherService: WeatherService = WeatherService()
    private static let locationService: LocationService = LocationService()
    private static let locationSearchService: LocationSearchService = LocationSearchService()
    private static let locationFavoritesService: LocationFavoritesService = LocationFavoritesService()
    private static let radarService: RadarService = RadarService()

    func body(content: Content) -> some View {
        content
            .colorScheme(.dark)
            .environmentObject(Self.appState)
            .environmentObject(Self.visualState)
            .environmentObject(Self.weekSectionState)
            .environmentObject(Self.locationPickerState)
            .environmentObject(Self.settingsSheetState)
            .environmentObject(Self.weatherService)
            .environmentObject(Self.locationService)
            .environmentObject(Self.locationSearchService)
            .environmentObject(Self.locationFavoritesService)
            .environmentObject(Self.radarService)

            .modifier(WeatherToLocationBinder(
                weatherService: Self.weatherService,
                locationService: Self.locationService,
                locationFavoritesService: Self.locationFavoritesService
            ))
            .modifier(VisualStateToAppStateAndWeatherBinder(
                appState: Self.appState,
                weekSectionState: Self.weekSectionState,
                visualState: Self.visualState,
                weatherService: Self.weatherService
            ))
            .modifier(VisualStateToWeekSectionStateAndWeatherBinder(
                weekSectionState: Self.weekSectionState,
                visualState: Self.visualState,
                weatherService: Self.weatherService,
                appState: Self.appState
            ))
            .modifier(LocationSearchToLocationPickerBinder(
                locationSearchService: Self.locationSearchService,
                locationPickerState: Self.locationPickerState
            ))
            .modifier(RadarToSettingsStateBinder(
                radarService: Self.radarService,
                settingsState: Self.settingsSheetState,
                appState: Self.appState
            ))
    }
}
