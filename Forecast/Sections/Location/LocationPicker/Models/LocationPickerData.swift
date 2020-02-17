//
//  LocationPickerData.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-16.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation
import Foundation

final class LocationPickerData {
    internal enum State {
        case normal
        case searching
    }

    private(set) var currentLocation: Location?
    private(set) var favoriteLocations: [Location]
    private(set) var state: State

    private(set) var searchResults: [Location]?

    init(currentLocation: Location?, favoriteLocations: [Location], state: State, searchResults: [Location]? = nil) {
        self.currentLocation = currentLocation
        self.favoriteLocations = favoriteLocations
        self.state = state
        self.searchResults = searchResults
    }
}

extension LocationPickerData: Equatable {
    static func == (lhs: LocationPickerData, rhs: LocationPickerData) -> Bool {
        return
            lhs.state == rhs.state &&
            lhs.currentLocation == rhs.currentLocation &&
            lhs.favoriteLocations == rhs.favoriteLocations &&
            lhs.searchResults == rhs.searchResults
    }
}
