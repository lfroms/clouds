//
//  WeatherAlert.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct WeatherAlert: Hashable, Equatable {
    var summary: String
    var date: DateInRegion
    var type: WarningType
    var status: WarningStatus

    internal enum WarningType: Equatable {
        case warning
        case watch
        case info

        var symbolName: String {
            switch self {
            case .warning:
                return SFSymbol.exclamationMarkTriangleFilled
            case .watch:
                return SFSymbol.exclamationMarkCircleFilled
            case .info:
                return SFSymbol.infoCircleFilled
            }
        }
    }

    internal enum WarningStatus: Equatable {
        case active
        case ended
    }

    var color: Color {
        if status == .ended {
            return .green
        }

        switch type {
        case .warning:
            return .red
        case .watch:
            return .yellow
        default:
            return .gray
        }
    }
}
