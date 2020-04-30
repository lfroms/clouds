//
//  Dimension.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class Dimension {
    final class Global {
        static let padding: CGFloat = 20
        static let cornerRadius: CGFloat = 22
    }

    final class Header {
        static let omniBarHeight: CGFloat = 52
        static let illustrationTopPadding: CGFloat = System.topSafeMargin
    }

    final class HourlyForecast {
        static let spacing: CGFloat = 14
    }

    final class MeasurementGrid {
        static let itemHeight: CGFloat = 50
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
        final class DayPicker {
            static let bubbleSize: CGFloat = 60
            static let spacing: CGFloat = 12

            static let indicatorSize: CGFloat = 10
            static let indicatorSpacing: CGFloat = 8
            static let bottomPadding: CGFloat = Global.padding
            static let topPadding: CGFloat = 12

            static let dayPickerVisualHeight: CGFloat
                = bubbleSize + indicatorSpacing + indicatorSize

            static let dayPickerTotalHeight: CGFloat
                = bottomPadding + dayPickerVisualHeight + topPadding
        }
    }

    final class RadarSection {
        final class RadarControls {
            static let controlHeight: CGFloat = 48
            static let spacing: CGFloat = 14
            static let bottomPadding: CGFloat = Global.padding

            static let totalHeight: CGFloat = controlHeight + spacing + bottomPadding
        }
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

        static var deviceIsiPhone8: Bool {
            Dimension.System.screenWidth <= 375 && UIScreen.main.nativeScale == 2
        }
    }
}
