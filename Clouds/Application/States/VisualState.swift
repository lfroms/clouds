//
//  VisualState.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-07.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

final class VisualState: ObservableObject {
    @Published private(set) var appearance: Appearance = Appearance(style: nil, scheme: .empty)

    func set(style: IconStyle?, colorScheme: ColorScheme?) {
        let newAppearance = Appearance(style: style, scheme: colorScheme ?? .empty)

        guard newAppearance != appearance else {
            return
        }

        appearance = newAppearance
    }
}
