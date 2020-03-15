//
//  AnyTransition+Presets.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var fadeAndScale: Self {
        .asymmetric(
            insertion: Self
                .scale(scale: 0.8)
                .animation(.easeInOut(duration: 0.16))
                .combined(with: Self.opacity.animation(.easeInOut(duration: 0.16))),

            removal: Self
                .scale(scale: 0.5)
                .animation(.easeInOut(duration: 0.24))
                .combined(with: Self.opacity.animation(.easeInOut(duration: 0.24)))
        )
    }
}