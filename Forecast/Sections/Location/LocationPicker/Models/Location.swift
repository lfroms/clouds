//
//  Location.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-16.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation
import Foundation

struct Location: Codable {
    let name: String
    let regionName: String
    let coordinate: CLLocationCoordinate2D
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.regionName == rhs.regionName &&
            lhs.coordinate.latitude == rhs.coordinate.latitude &&
            lhs.coordinate.longitude == rhs.coordinate.longitude
    }
}
