//
//  WarningPriority+Color.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-03-30.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftUI

extension WarningPriority {
    private static var defaultColor = Color(red: 0.38, green: 0.38, blue: 0.38, opacity: 1.0)

    private static let colors: [WarningPriority: Color] = [
        .low: defaultColor,
        .medium: Color(red: 1.00, green: 0.92, blue: 0.00, opacity: 1.0),
        .high: Color(red: 0.96, green: 0.26, blue: 0.21, opacity: 1.0),
        .urgent: Color(red: 0.96, green: 0.26, blue: 0.21, opacity: 1.0)
    ]

    var color: Color {
        return WarningPriority.colors[self, default: WarningPriority.defaultColor]
    }
}
