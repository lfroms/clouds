//
//  FramePreferenceKey.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FramePreferenceKey: PreferenceKey {
    static var defaultValue = CGRect(x: 0, y: 0, width: 0, height: 0)

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }

    typealias Value = CGRect
}
