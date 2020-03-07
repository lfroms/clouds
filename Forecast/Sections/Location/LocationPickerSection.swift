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
    @EnvironmentObject private var locationPickerState: LocationPickerState
    @EnvironmentObject private var weatherService: WeatherService
    @EnvironmentObject private var locationService: LocationService
    @EnvironmentObject private var locationSearchService: LocationSearchService
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService

    var body: some View {
        ZStack(alignment: .topLeading) {
            BlackBackground()
                .clipShape(RoundedCornerShape(cornerRadius: 22, style: .continuous, corners: [.topLeft, .topRight]))
                .edgesIgnoringSafeArea(.all)

            LocationPicker(
                appState: .constant(appState),
                weatherService: .constant(weatherService),
                locationService: .constant(locationService),
                locationSearchService: .constant(locationSearchService),
                locationFavoritesService: .constant(locationFavoritesService),
                didPerformDismiss: handlePickerDismiss)
        }
        .offset(searchOffset)
    }

    private var searchOffset: CGSize {
        return CGSize(width: 0, height: self.locationPickerState.presented ? 0 : Dimension.System.screenHeight)
    }

    private func handlePickerDismiss() {
        self.locationPickerState.toggleLocationPicker(animated: true)
        self.locationSearchService.searchQuery.clear()
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerSection()
    }
}
