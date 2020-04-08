//
//  DayPickerItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-08.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct DayPickerItem: Equatable {
    let date: Date
    let hasDayConditions: Bool
    let hasNightConditions: Bool
}
