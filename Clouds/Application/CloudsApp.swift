//
//  CloudsApp.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-06-26.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
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

    let debouncer = Debouncer(timeInterval: 0.3)

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
                .onChange(of: locationService.lastLocation?.coordinate) { coordinate in
                    weatherService.fetch(
                        selectedLocation: locationFavoritesService.activeLocation?.coordinate,
                        userLocation: coordinate
                    )
                }
                .onAppear(perform: didBecomeActive)
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .active:
                        didBecomeActive()
                    default:
                        didEnterBackground()
                    }
                }
                .onReceive(weatherService.shouldLoadUpdatedWeather.debounce(for: .seconds(0.15), scheduler: RunLoop.main)) { _ in
                    fetchWeather()
                }
                .onReceive(weatherService.didLoadUpdatedWeather.receive(on: RunLoop.main).debounce(for: .seconds(0.2), scheduler: RunLoop.main), perform: changeIconCodeBasedOnSection)
                .onChange(of: weekSectionState.dayIndex) { _ in
                    debouncer.renewInterval()
                    debouncer.handler = setIconCodeToWeekSectionActiveDay
                }

                .onChange(of: appState.activeSection) { _ in
                    didChangeAppSection()
                    changeIconCodeBasedOnSection()
                }

                .onChange(of: weekSectionState.showingNightConditions) { _ in
                    setIconCodeToWeekSectionActiveDay()
                }
                .onChange(of: locationPickerState.presented, perform: { _ in
                    didChangeLocationPickerState()
                })
                .onChange(of: settingsSheetState.radarSource) { _ in
                    getRadarTimestamps()
                }
        }
    }

    // MARK: - Binding Functions

    private func fetchWeather() {
        weatherService.fetch(
            selectedLocation: locationFavoritesService.activeLocation?.coordinate,
            userLocation: locationService.lastLocation?.coordinate
        )
    }

    private func didBecomeActive() {
        if appState.activeSection == .radar {
            getRadarTimestamps()
        }

        locationService.startUpdatingLocation()
        fetchWeather()
    }

    private func didEnterBackground() {
        radarService.isPlaying = false
        locationService.stopUpdatingLocation()
    }

    // MARK: - Visual State/App State

    private func setIconCodeToCurrentConditions() {
        visualState.set(
            style: weatherService.weather?.currently.icon.style,
            colorScheme: weatherService.weather?.currently.icon.colorScheme,
            animated: true
        )
    }

    private func setIconCodeToDailyForecast() {
        let index = weekSectionState.dayIndex
        let days = weatherService.weather?.daily

        let day = days?[safe: index]

        if day?.daytimeConditions == nil, day?.nighttimeConditions != nil {
            visualState.set(
                style: day?.nighttimeConditions?.icon.style,
                colorScheme: day?.nighttimeConditions?.icon.colorScheme,
                animated: true
            )

            return
        }

        if day?.nighttimeConditions == nil, day?.daytimeConditions != nil {
            visualState.set(
                style: day?.daytimeConditions?.icon.style,
                colorScheme: day?.daytimeConditions?.icon.colorScheme,
                animated: true
            )

            return
        }

        let style = weekSectionState.showingNightConditions ? day?.nighttimeConditions?.icon.style : day?.daytimeConditions?.icon.style
        let colorScheme = weekSectionState.showingNightConditions ? day?.nighttimeConditions?.icon.colorScheme : day?.daytimeConditions?.icon.colorScheme

        visualState.set(style: style, colorScheme: colorScheme, animated: true)
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
            visualState.set(style: day?.nighttimeConditions?.icon.style, colorScheme: day?.nighttimeConditions?.icon.colorScheme, animated: true)
            return
        }

        if day?.nighttimeConditions == nil, day?.daytimeConditions != nil {
            visualState.set(style: day?.daytimeConditions?.icon.style, colorScheme: day?.daytimeConditions?.icon.colorScheme, animated: true)
            return
        }

        let style = weekSectionState.showingNightConditions ? day?.nighttimeConditions?.icon.style : day?.daytimeConditions?.icon.style
        let colorScheme = weekSectionState.showingNightConditions ? day?.nighttimeConditions?.icon.colorScheme : day?.daytimeConditions?.icon.colorScheme

        visualState.set(style: style, colorScheme: colorScheme, animated: true)
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
    }

    // MARK: - Radar

    private func getRadarTimestamps() {
        radarService.getRadarTimestamps(for: settingsSheetState.radarSource)
    }

    private func didChangeAppSection() {
        radarService.isPlaying = false
    }
}
