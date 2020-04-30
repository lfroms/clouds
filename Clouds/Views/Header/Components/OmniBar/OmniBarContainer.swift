//
//  OmniBarContainer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBarContainer: Container {
    @EnvironmentObject private var settingsSheetState: SettingsSheetState
    @EnvironmentObject private var locationPickerState: LocationPickerState
    @EnvironmentObject private var locationService: LocationService
    @EnvironmentObject private var locationFavoritesService: LocationFavoritesService
    @EnvironmentObject private var locationSearchService: LocationSearchService

    var body: some View {
        OmniBar(
            textFieldValue: textFieldValue,
            readOnly: !locationPickerState.presented,
            primaryIcon: primaryIcon,
            auxiliaryIcon: auxiliaryIcon,
            didBecomeActive: omniBarDidBecomeActive,
            auxiliaryAction: clearOrClose
        )
        .equatable()
        .onReceive(locationPickerState.objectWillChange, perform: clearIfAboutToClose)
    }

    // MARK: - Actions

    private func omniBarDidBecomeActive() {
        locationPickerState.toggleLocationPicker(animated: true)
    }

    private func clearIfAboutToClose(_: LocationPickerState.ObjectWillChangePublisher.Output) {
        if !locationPickerState.presented, !locationSearchService.searchQuery.isEmpty {
            locationSearchService.searchQuery = .empty
        }
    }

    private func clearOrClose() {
        guard locationPickerState.presented else {
            settingsSheetState.presented.toggle()
            return
        }

        if locationSearchService.searchQuery.isEmpty {
            locationPickerState.toggleLocationPicker(animated: true)
            return
        }

        locationSearchService.searchQuery.clear()
    }

    // MARK: - Text Field

    private var textFieldValue: Binding<String> {
        return .init(get: {
            self.textFieldTextToDisplay

        }, set: { value in
            self.locationSearchService.searchQuery = value
        })
    }

    private var textFieldTextToDisplay: String {
        if locationPickerState.presented {
            return locationSearchService.searchQuery
        }

        if let activeLocation = locationFavoritesService.activeLocation {
            return activeLocation.name
        }

        if let locality = locationService.lastPlacemark?.locality {
            return locality
        }

        return .empty
    }

    // MARK: - Icons

    private var primaryIcon: String {
        if locationPickerState.presented || textFieldTextToDisplay.isEmpty {
            return SFSymbol.magnifyingGlass
        }

        if let activeLocation = locationFavoritesService.activeLocation {
            let isFavorite = locationFavoritesService.favoriteLocations.contains(activeLocation)

            return isFavorite ? SFSymbol.starFilled : SFSymbol.mapFilled
        }

        return SFSymbol.locationFilled
    }

    private var auxiliaryIcon: String {
        locationPickerState.presented
            ? SFSymbol.xMark
            : SFSymbol.sliderHorizontal3
    }
}

struct OmniBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        OmniBarContainer()
            .environmentObject(LocationPickerState())
            .environmentObject(LocationSearchService())
    }
}
