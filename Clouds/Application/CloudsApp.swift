//
//  CloudsApp.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-06-26.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation
import SwiftUI

@main
struct CloudsApp: App {
    @Environment(\.scenePhase) private var scenePhase

    @StateObject private var appState: AppState = AppState()
    @StateObject private var visualState: VisualState = VisualState()
    @StateObject private var weekSectionState: WeekSectionState = WeekSectionState()
    @StateObject private var locationPickerState: LocationPickerState = LocationPickerState()
    @StateObject private var settingsSheetState: SettingsSheetState = SettingsSheetState()

    @StateObject private var weatherService: WeatherService = WeatherService()
    @StateObject private var locationService: LocationService = LocationService()
    @StateObject private var locationSearchService: LocationSearchService = LocationSearchService()
    @StateObject private var locationFavoritesService: LocationFavoritesService = LocationFavoritesService()
    @StateObject private var radarService: RadarService = RadarService()

    var body: some Scene {
        WindowGroup {
            AppLayout()
                .preferredColorScheme(.dark)
                .environmentObject(appState)
                .environmentObject(visualState)
                .environmentObject(weekSectionState)
                .environmentObject(locationPickerState)
                .environmentObject(settingsSheetState)
                .environmentObject(weatherService)
                .environmentObject(locationService)
                .environmentObject(locationSearchService)
                .environmentObject(locationFavoritesService)
                .environmentObject(radarService)

                .onAppear(perform: applicationDidBecomeActive)
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .active:
                        applicationDidBecomeActive()
                    default:
                        applicationDidBecomeInactive()
                    }
                }

                .onChange(of: locationService.lastLocation?.coordinate) { newCoordinate in
                    guard locationFavoritesService.activeLocation == nil else {
                        return
                    }

                    fetchUpdatedWeatherData(coordinate: newCoordinate)
                }

                .onChange(of: locationFavoritesService.activeLocation) { newLocation in
                    fetchUpdatedWeatherData(coordinate: newLocation?.coordinate)
                }

                .onChange(of: weatherService.loading) { newLoading in
                    if newLoading == false {
                        changeIconCodeBasedOnSection()
                    }
                }

                .onChange(of: weekSectionState.dayIndex) { _ in
                    setIconCodeToWeekSectionActiveDay()
                }

                .onChange(of: appState.activeSection) { _ in
                    radarService.isPlaying = false
                    changeIconCodeBasedOnSection()
                }

                .onChange(of: weekSectionState.showingNightConditions) { _ in
                    setIconCodeToWeekSectionActiveDay()
                }

                .onChange(of: locationPickerState.presented) { _ in
                    didChangeLocationPickerState()
                }

                .onChange(of: settingsSheetState.radarSource) { _ in
                    getRadarTimestamps()
                }
        }
    }

    private func fetchUpdatedWeatherData(coordinate: CLLocationCoordinate2D? = nil) {
        let userLocation = coordinate ?? locationService.lastLocation?.coordinate

        weatherService.fetch(
            selectedLocation: locationFavoritesService.activeLocation?.coordinate,
            userLocation: userLocation
        )
    }

    private func applicationDidBecomeActive() {
        if appState.activeSection == .radar {
            getRadarTimestamps()
        }

        locationService.startUpdatingLocation()
        fetchUpdatedWeatherData()
    }

    private func applicationDidBecomeInactive() {
        radarService.isPlaying = false
        locationService.stopUpdatingLocation()
    }

    // MARK: - Visual State/App State

    private func setIconCodeToCurrentConditions() {
        visualState.set(
            style: weatherService.weather?.currently.icon.style,
            colorScheme: weatherService.weather?.currently.icon.colorScheme
        )
    }

    private func setIconCodeToDailyForecast() {
        let index = weekSectionState.dayIndex
        let days = weatherService.weather?.daily

        let day = days?[safe: index]

        if day?.daytimeConditions == nil, day?.nighttimeConditions != nil {
            visualState.set(
                style: day?.nighttimeConditions?.icon.style,
                colorScheme: day?.nighttimeConditions?.icon.colorScheme
            )

            return
        }

        if day?.nighttimeConditions == nil, day?.daytimeConditions != nil {
            visualState.set(
                style: day?.daytimeConditions?.icon.style,
                colorScheme: day?.daytimeConditions?.icon.colorScheme
            )

            return
        }

        let style = weekSectionState.showingNightConditions ? day?.nighttimeConditions?.icon.style : day?.daytimeConditions?.icon.style
        let colorScheme = weekSectionState.showingNightConditions ? day?.nighttimeConditions?.icon.colorScheme : day?.daytimeConditions?.icon.colorScheme

        visualState.set(style: style, colorScheme: colorScheme)
    }

    private func changeIconCodeBasedOnSection() {
        if appState.activeSection != .week {
            resetWeekSection()
        }

        switch appState.activeSection {
        case .now:
            setIconCodeToCurrentConditions()

        case .week:
            setIconCodeToDailyForecast()

        case .radar:
            break
        }
    }

    private func resetWeekSection() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.weekSectionState.dayIndex = 0
            self.weekSectionState.showingNightConditions = false
        }
    }

    // MARK: - Week Section

    private func setIconCodeToWeekSectionActiveDay() {
        guard appState.activeSection == .week else {
            return
        }

        let index = weekSectionState.dayIndex
        let days = weatherService.weather?.daily

        let day = days?[safe: index]

        if day?.daytimeConditions == nil, day?.nighttimeConditions != nil {
            visualState.set(style: day?.nighttimeConditions?.icon.style, colorScheme: day?.nighttimeConditions?.icon.colorScheme)
            return
        }

        if day?.nighttimeConditions == nil, day?.daytimeConditions != nil {
            visualState.set(style: day?.daytimeConditions?.icon.style, colorScheme: day?.daytimeConditions?.icon.colorScheme)
            return
        }

        let style = weekSectionState.showingNightConditions ? day?.nighttimeConditions?.icon.style : day?.daytimeConditions?.icon.style
        let colorScheme = weekSectionState.showingNightConditions ? day?.nighttimeConditions?.icon.colorScheme : day?.daytimeConditions?.icon.colorScheme

        visualState.set(style: style, colorScheme: colorScheme)
    }

    // MARK: - Location Picker

    private func didChangeLocationPickerState() {
        guard
            locationPickerState.presented,
            !locationSearchService.searchQuery.isEmpty
        else {
            return
        }

        locationSearchService.searchQuery.clear()
        fetchUpdatedWeatherData()
    }

    // MARK: - Radar

    private func getRadarTimestamps() {
        radarService.getRadarTimestamps(for: settingsSheetState.radarSource)
    }
}
