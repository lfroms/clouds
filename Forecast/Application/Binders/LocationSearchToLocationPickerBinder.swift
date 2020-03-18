//
//  LocationSearchToLocationPickerBinder.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

struct LocationSearchToLocationPickerBinder: ViewModifier {
    private var locationSearchService: LocationSearchService
    private var locationPickerState: LocationPickerState

    private lazy var locationPickerStateCancellable: AnyCancellable? = nil

    init(locationSearchService: LocationSearchService, locationPickerState: LocationPickerState) {
        self.locationSearchService = locationSearchService
        self.locationPickerState = locationPickerState

        locationPickerStateCancellable = locationPickerState.objectWillChange
            .sink(receiveValue: didChangeLocationPickerState)
    }

    func body(content: Content) -> some View {
        content
    }

    // MARK: - Binding Functions

    private func didChangeLocationPickerState() {
        guard
            locationPickerState.presented,
            !locationSearchService.searchQuery.isEmpty
        else {
            return
        }

        locationSearchService.searchQuery.clear()
    }
}
