//
//  LocationNameHelper.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-27.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation
import Foundation

final class LocationNameHelper {
    static let shared = LocationNameHelper()

    func createRegionNameFrom(placemark: CLPlacemark) -> String {
        var components: [String] = []

        if let administrativeArea = placemark.administrativeArea {
            components.append(administrativeArea)
        }

        if let country = placemark.country {
            components.append(country)
        }

        return components.joined(separator: ", ")
    }
}
