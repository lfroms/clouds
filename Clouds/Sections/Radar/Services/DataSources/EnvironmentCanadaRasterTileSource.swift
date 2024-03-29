//
//  EnvironmentCanadaRasterTileSource.swift
//  Clouds
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

        let attribution = MGLAttributionInfo(
            title: NSAttributedString(string: "Environment and Climate Change Canada"),
            url: URL(string: "https://www.canada.ca/en/environment-climate-change.html")
        )

        self.init(
            identifier: identifier,
            tileURLTemplates: [urlTemplate],
            options: [
                .tileSize: 1024,
                .attributionInfos: [attribution]
            ]
        )
    }

    private static func urlTemplate(for date: Date) -> String? {
        WMSResourceURL(
            host: "geo.weather.gc.ca",
            path: "geomet",
            version: "1.3.0",
            request: "GetMap",
            format: "image/png",
            transparent: true,
            layer: "RADAR_1KM_RRAI",
            tiled: true,
            date: date,
            coordinateReferenceSystem: "EPSG:3857",
            width: 1024,
            height: 1024,
            boundingBoxTemplate: "{bbox-epsg-3857}"
        ).string
    }
}
