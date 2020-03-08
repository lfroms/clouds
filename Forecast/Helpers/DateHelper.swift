//
//  DateHelper.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate

final class DateHelper {
    static func inUTCTime(time: UnixTimestamp) -> DateInRegion {
        DateInRegion(seconds: TimeInterval(time), region: .UTC)
    }
}
