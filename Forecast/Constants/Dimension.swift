//
//  Dimension.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class Dimension {
    final class Header {
        static let padding: CGFloat = 20
        static let omniBarHeight: CGFloat = 52
    }

    final class Animation {
        static let shrinkAmount: CGFloat = 0.95
    }

    final class Spacing {
        static let barItems: CGFloat = 12
    }

    final class LocationPicker {
        static let releaseToDismissThreshold: CGFloat = 80
        static let sectionSpacing: CGFloat = 30
        static let itemSpacing: CGFloat = 10
        static let itemHeight: CGFloat = 57
    }

    final class System {
        static var topSafeMargin: CGFloat {
            let window = UIApplication.shared.windows.first
            return window?.safeAreaInsets.top ?? 0
        }
    }
}
