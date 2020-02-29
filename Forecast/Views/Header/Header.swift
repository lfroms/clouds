//
//  Header.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var provider: WeatherProvider
    @EnvironmentObject private var locationPickerState: LocationPickerState

    var body: some View {
        ZStack(alignment: .top) {
            HeaderGradientBackground()
                .edgesIgnoringSafeArea(.top)

            VStack(alignment: .leading, spacing: Dimension.Header.padding) {
                OmniBar(
                    textFieldValue: textFieldValueBinding,
                    isReadOnly: !appState.showingLocationPicker,
                    primaryIcon: primaryIcon,
                    auxiliaryIcon: self.auxiliaryIcon,
                    auxiliaryButtonAction: self.clearOrClose,
                    barFocusAction: {
                        self.appState.toggleLocationPicker(animated: true)
                    }
                )

                HeaderAccessories()
            }
            .padding(Dimension.Header.padding)
        }
        .onReceive(appState.objectWillChange, perform: clearIfAboutToClose)
    }

    private var primaryIcon: String {
        if appState.showingLocationPicker || textFieldTextToDisplay.isEmpty {
            return "magnifyingglass"
        }

        if UserSettings.getActiveLocation() != nil {
            return "star.fill"
        }

        return "location.fill"
    }

    private var auxiliaryIcon: String {
        appState.showingLocationPicker ? "xmark.circle.fill" : "slider.horizontal.3"
    }

    private var textFieldValueBinding: Binding<String> {
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

        if let locality = provider.locationManager.lastPlacemark?.locality {
            return locality
        }

        return ""
    }

    private func clearIfAboutToClose(_: AppState.ObjectWillChangePublisher.Output) {
        if !appState.showingLocationPicker {
            locationPickerState.searchQuery = ""
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
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
