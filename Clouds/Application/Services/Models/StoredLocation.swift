//
//  StoredLocation.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-02-16.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation
import Foundation

struct StoredLocation: Codable, Hashable {
    let name: String
    let regionName: String
    let coordinate: CLLocationCoordinate2D

    func hash(into hasher: inout Hasher) {
        hasher.combine(coordinate.latitude)
        hasher.combine(coordinate.longitude)
    }
}

extension StoredLocation: Equatable {
    static func == (lhs: StoredLocation, rhs: StoredLocation) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.regionName == rhs.regionName &&
            lhs.coordinate.latitude == rhs.coordinate.latitude &&
            lhs.coordinate.longitude == rhs.coordinate.longitude
    }
}
