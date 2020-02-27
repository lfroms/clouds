//
//  Header.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject private var provider: WeatherProvider
    @EnvironmentObject private var appState: AppState
    @State private var textFieldValue: String = ""

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
                    auxiliaryButtonAction: {
                        self.textFieldValue = ""
                    },
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
            self.textFieldValue = value
        })
    }

    private var textFieldTextToDisplay: String {
        if appState.showingLocationPicker {
            return textFieldValue
        }

        if let activeLocation = UserSettings.getActiveLocation() {
            return activeLocation.regionName
        }

        if let locality = provider.locationManager.lastPlacemark?.locality {
            return locality
        }

        return ""
    }

    private func clearIfAboutToClose(_: AppState.ObjectWillChangePublisher.Output) {
        if !appState.showingLocationPicker {
            textFieldValue = ""
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
