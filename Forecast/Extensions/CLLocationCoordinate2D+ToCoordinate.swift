//
//  CLLocationCoordinate2D+ToCoordinate.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D {
    var asGraphQLCoordinate: Coordinate {
        Coordinate(latitude: self.latitude, longitude: self.longitude)
    }
}

extension Array where Element == CLLocationCoordinate2D {
    var asGraphQLCoordinates: [Coordinate] {
        self.compactMap { coordinate in
            coordinate.asGraphQLCoordinate
        }
    }
}
