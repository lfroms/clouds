//
//  AppServices.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppServices: ViewModifier {
    internal static let appState: AppState = AppState()
    internal static let visualState: VisualState = VisualState()
    internal static let weekSectionState: WeekSectionState = WeekSectionState()
    internal static let locationPickerState: LocationPickerState = LocationPickerState()
    internal static let settingsSheetState: SettingsSheetState = SettingsSheetState()

    internal static let weatherService: WeatherService = WeatherService()
    internal static let locationService: LocationService = LocationService()
    internal static let locationSearchService: LocationSearchService = LocationSearchService()
    internal static let locationFavoritesService: LocationFavoritesService = LocationFavoritesService()
    internal static let radarService: RadarService = RadarService()

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
