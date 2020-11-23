//
//  WeatherEntry.swift
//  CloudsWidgetExtension
//
//  Created by Lukas Romsicki on 2020-11-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CloudsAPI
import WidgetKit

struct WeatherEntry: TimelineEntry {
    var date: Date

    var iconStyle: CloudsAPI.IconStyle?
    var colorScheme: CloudsAPI.ColorScheme?
    var temperature: Double?
    var description: String?
}
