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
        static let illustrationTopPadding: CGFloat = System.topSafeMargin
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

    final class WeekSection {
        static let dayCardWidth: CGFloat = 215
        static let cardSpacing: CGFloat = 14
        static let pageSize = dayCardWidth + cardSpacing
    }

    final class System {
        private static var firstWindow = UIApplication.shared.windows.first

        static var topSafeMargin: CGFloat {
            return firstWindow?.safeAreaInsets.top ?? 0
        }

        static var screenHeight: CGFloat {
            return firstWindow?.frame.height ?? 0
        }

        static var screenWidth: CGFloat {
            return firstWindow?.frame.width ?? 0
        }
    }
}
