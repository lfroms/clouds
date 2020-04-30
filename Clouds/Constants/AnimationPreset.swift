//
//  AnimationPreset.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class AnimationPreset {
    final class Touch {
        static let shrink: Animation = .easeInOut(duration: 0.2)
        static let expand: Animation = shrink
    }

    final class TabControl {
        static let backdropSlide: Animation = .spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0)
    }
}
