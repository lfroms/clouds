//
//  AppSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-01.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

enum AppSection: String {
    case now = "Now"
    case week = "Week"
    case radar = "Radar"

    var name: String {
        self.rawValue
    }

    static let list: [AppSection] = [.now, .week, .radar]
}
