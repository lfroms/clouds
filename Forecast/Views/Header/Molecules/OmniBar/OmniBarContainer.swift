//
//  OmniBarContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBarContainer: Container {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var weather: WeatherProvider
    @EnvironmentObject private var locationPickerState: LocationPickerState

    var body: some View {
        OmniBar(
            textFieldValue: textFieldValue,
            readOnly: !appState.showingLocationPicker,
            primaryIcon: primaryIcon,
            auxiliaryIcon: auxiliaryIcon,
            didBecomeActive: omniBarDidBecomeActive,
            auxiliaryAction: clearOrClose
        )
        .equatable()
        .onReceive(appState.objectWillChange, perform: clearIfAboutToClose)
    }

    // MARK: - Actions

    private func omniBarDidBecomeActive() {
        appState.toggleLocationPicker(animated: true)
    }

    private func clearIfAboutToClose(_: AppState.ObjectWillChangePublisher.Output) {
        if !appState.showingLocationPicker, !locationPickerState.searchQuery.isEmpty {
            locationPickerState.searchQuery = .empty
        }
    }

    private func clearOrClose() {
        guard appState.showingLocationPicker else {
            appState.showingSettingsSheet.toggle()
            return
        }

        if locationPickerState.searchQuery.isEmpty {
            appState.toggleLocationPicker(animated: true)
            return
        }

        locationPickerState.searchQuery.clear()
    }

    // MARK: - Text Field

    private var textFieldIsReadOnly: Bool {
        !appState.showingLocationPicker
    }

    private var textFieldValue: Binding<String> {
        return .init(get: {
            self.textFieldTextToDisplay

        }, set: { value in
            self.locationPickerState.searchQuery = value
        })
    }

    private var textFieldTextToDisplay: String {
        if appState.showingLocationPicker {
            return locationPickerState.searchQuery
        }

        if let activeLocation = UserSettings.getActiveLocation() {
            return activeLocation.name
        }

        if let locality = weather.locationManager.lastPlacemark?.locality {
            return locality
        }

        return .empty
    }

    // MARK: - Icons

    private var primaryIcon: String {
        if appState.showingLocationPicker || textFieldTextToDisplay.isEmpty {
            return SFSymbol.magnifyingGlass
        }

        if UserSettings.getActiveLocation() != nil {
            return SFSymbol.starFilled
        }

        return SFSymbol.locationFilled
    }

    private var auxiliaryIcon: String {
        appState.showingLocationPicker
            ? SFSymbol.xMarkCircleFilled
            : SFSymbol.sliderHorizontal3
    }
}

struct OmniBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        OmniBarContainer()
            .environmentObject(AppState())
            .environmentObject(WeatherProvider())
            .environmentObject(LocationPickerState())
    }
}
