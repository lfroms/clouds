//
//  FavoriteLocationWeather.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation
import Foundation

struct FavoriteLocationWeather {
    let coordinate: CLLocationCoordinate2D
    let temperature: Double?
    let iconCode: Int?
}
