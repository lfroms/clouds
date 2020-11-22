//
//  CloudsApp.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-06-26.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import AppCenter
import AppCenterAnalytics
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

    private let standardVisualStateDebouncer = Debouncer(delay: 0.18)
    private let weekSectionVisualStateDebouncer = Debouncer(delay: 0.3)

    init() {
        AppCenter.start(withAppSecret: AppEnvironment.appCenterApiKey, services: [Analytics.self])
    }

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

                .onChange(of: weatherService.weather.debugDescription) { _ in
                    standardVisualStateDebouncer.run {
                        changeIconCodeBasedOnSection()
                    }
                }

                .onChange(of: weekSectionState.dayIndex) { _ in
                    if weekSectionState.dragging {
                        weekSectionVisualStateDebouncer.run {
                            setIconCodeToWeekSectionActiveDay()
                        }
                    } else {
                        setIconCodeToWeekSectionActiveDay()
                    }
                }

                .onChange(of: appState.activeSection) { newSection in
                    radarService.isPlaying = false
                    changeIconCodeBasedOnSection()

                    Analytics.trackEvent("Tab changed", withProperties: ["Tab": newSection.rawValue])
                }

                .onChange(of: weekSectionState.showingNightConditions) { showingNight in
                    setIconCodeToWeekSectionActiveDay()

                    Analytics.trackEvent("Night conditions toggled", withProperties: ["Showing night": String(showingNight)])
                }

                .onChange(of: locationPickerState.presented) { presented in
                    if presented {
                        didChangeLocationPickerState()
                    }

                    Analytics.trackEvent(presented ? "Location picker opened" : "Location picker closed")
                }

                .onChange(of: settingsSheetState.radarSource) { newSource in
                    getRadarTimestamps()

                    Analytics.trackEvent("Radar source changed", withProperties: ["Source": newSource.rawValue])
                }

                .onChange(of: appState.drawerIsOpen) { open in
                    Analytics.trackEvent(open ? "Drawer opened" : "Drawer closed")
                }

                .onChange(of: settingsSheetState.presented) { open in
                    Analytics.trackEvent(open ? "Settings opened" : "Settings closed")
                }

                .onChange(of: radarService.isPlaying) { playing in
                    Analytics.trackEvent(playing ? "Radar animation started" : "Radar animation stopped")
                }

                .ignoresSafeArea(.keyboard)
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

        if locationService.locationStatus != .authorizedWhenInUse || locationFavoritesService.activeLocation != nil {
            fetchUpdatedWeatherData()
        }
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
        guard !locationSearchService.searchQuery.isEmpty else {
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
