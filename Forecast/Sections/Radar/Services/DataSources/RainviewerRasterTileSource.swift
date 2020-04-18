//
//  RainviewerRasterTileSource.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import Mapbox

final class RainviewerRasterTileSource: MGLRasterTileSource {
    convenience init(identifier: String, date: Date) {
        let urlTemplate = Self.urlTemplate(for: date)
        self.init(identifier: identifier, tileURLTemplates: [urlTemplate], options: [.tileSize: 256])
    }

    private static func urlTemplate(for date: Date) -> String {
        "https://tilecache.rainviewer.com/v2/radar/\(date.timeIntervalSince1970)/256/{z}/{x}/{y}/4/1_0.png"
    }
}
