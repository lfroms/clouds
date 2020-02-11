//
//  LocationPickerSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPickerSection: View {
    @EnvironmentObject private var appState: AppState
    @ObservedObject private var locationManager = LocationManager()

    var body: some View {
        ZStack(alignment: Alignment.topLeading) {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)

            LocationPickerView(didPerformDismiss: self.handlePickerDismiss)
        }
    }

    private var currentLocationName: String {
        guard let placemark = locationManager.lastPlacemark else {
            return ""
        }

        var components: [String] = []

        if let subLocality = placemark.subLocality {
            components.append(subLocality)
        }

        if let locality = placemark.locality {
            components.append(locality)
        }

        if let countryCode = placemark.isoCountryCode {
            components.append(countryCode)
        }

        return components.joined(separator: ", ")
    }

    private func handlePickerDismiss() {
        self.appState.toggleLocationPicker(animated: true)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerSection()
    }
}
