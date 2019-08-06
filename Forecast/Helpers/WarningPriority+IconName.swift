//
//  WarningPriority+IconName.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-03-30.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation

extension WarningPriority {
    private static let defaultIconName = "info.circle.fill"

    private static let iconNames: [WarningPriority: String] = [
        .low: defaultIconName,
        .medium: "exclamationmark.circle.fill",
        .high: "exclamationmark.triangle.fill",
        .urgent: "exclamationmark.triangle.fill"
    ]

    var iconName: String {
        return WarningPriority.iconNames[self, default: WarningPriority.defaultIconName]
    }
}
