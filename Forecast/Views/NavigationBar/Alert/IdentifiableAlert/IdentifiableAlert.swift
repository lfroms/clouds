//
//  IdentifiableAlert.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct IdentifiableAlert: Identifiable {
    var id = UUID()
    var event: WeatherQuery.Data.Weather.Warning.Event
}
