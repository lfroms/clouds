//
//  EnvironmentCanadaRasterTileSource.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import Mapbox

final class EnvironmentCanadaRasterTileSource: MGLRasterTileSource {
    convenience init(identifier: String, date: Date) {
        guard let urlTemplate = Self.urlTemplate(for: date) else {
            self.init(identifier: identifier, tileURLTemplates: [])
            return
        }

        self.init(identifier: identifier, tileURLTemplates: [urlTemplate], options: [.tileSize: 256])
    }

    private static func urlTemplate(for date: Date) -> String? {
        WMSResourceURL(
            host: "geo.weather.gc.ca",
            path: "geomet",
            version: "1.3.0",
            request: "GetMap",
            format: "image/png",
            transparent: true,
            layer: "RADAR_1KM_RSNO",
            tiled: true,
            date: date,
            coordinateReferenceSystem: "EPSG:3857",
            width: 256,
            height: 256,
            boundingBoxTemplate: "{bbox-epsg-3857}"
        ).string
    }
}
