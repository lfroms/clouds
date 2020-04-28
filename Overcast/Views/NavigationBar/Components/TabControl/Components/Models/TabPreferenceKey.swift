//
//  TabPreferenceKey.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabPreferenceKey: PreferenceKey {
    typealias Value = [TabPreferenceData]

    static var defaultValue: [TabPreferenceData] = []

    static func reduce(value: inout [TabPreferenceData], nextValue: () -> [TabPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}
