//
//  DetailBlockDescriptor.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-06.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DetailBlockDescriptor: Identifiable {
    let id = UUID()

    var symbolName: String
    var value: String
    var valuePrefix: String?
    var label: String
}
