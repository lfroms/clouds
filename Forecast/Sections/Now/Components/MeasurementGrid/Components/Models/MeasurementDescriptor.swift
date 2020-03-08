//
//  MeasurementDescriptor.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MeasurementDescriptor: Hashable, Equatable {
    let label: String
    let value: String
    let color: Color
    var prefix: String?
}
