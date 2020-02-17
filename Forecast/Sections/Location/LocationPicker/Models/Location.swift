//
//  Location.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-16.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation
import Foundation

struct Location {
    let name: String
    let location: CLLocation
    let isFavorite: Bool = false
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.location.coordinate.latitude == rhs.location.coordinate.latitude &&
            lhs.location.coordinate.longitude == rhs.location.coordinate.longitude &&
            lhs.isFavorite == rhs.isFavorite
    }
}
