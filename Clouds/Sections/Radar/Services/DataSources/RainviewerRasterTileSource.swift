//
//  RainviewerRasterTileSource.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import Mapbox

final class RainviewerRasterTileSource: MGLRasterTileSource {
    convenience init(identifier: String, date: Date) {
        let urlTemplate = Self.urlTemplate(for: date)
        self.init(identifier: identifier, tileURLTemplates: [urlTemplate], options: [.tileSize: 512])
    }

    private static func urlTemplate(for date: Date) -> String {
        let timestamp = Int(date.timeIntervalSince1970)
        return "https://tilecache.rainviewer.com/v2/radar/\(timestamp)/512/{z}/{x}/{y}/4/0_0.png"
    }
}
