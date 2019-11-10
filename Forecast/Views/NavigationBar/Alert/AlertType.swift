//
//  AlertType.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

enum AlertType {
    case info
    case watch
    case warning

    struct Style {
        let color: Color
        let symbolName: String
    }

    var style: Style {
        switch self {
        case .info:
            return .init(color: .white, symbolName: "info.circle.fill")
        case .watch:
            return .init(color: .init(red: 255, green: 204, blue: 0), symbolName: "exclamationmark.circle.fill")
        case .warning:
            return .init(color: .init(red: 255, green: 59, blue: 48), symbolName: "exclamationmark.triangle.fill")
        }
    }
}
