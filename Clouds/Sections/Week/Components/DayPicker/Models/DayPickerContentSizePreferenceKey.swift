//
//  DayPickerContentSizePreferenceKey.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-19.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayPickerContentSizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: Value = .zero

    static func reduce(value: inout Value, nextValue: () -> Value) {
        _ = nextValue()
    }
}
