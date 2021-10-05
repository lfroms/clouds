//
//  EnvironmentCanadaRasterTileSource.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import MapboxMaps

final class EnvironmentCanadaRasterTileSource: TileSource {
    private let id: String
    private let date: Date

    init(id: String, date: Date) {
        self.id = id
        self.date = date
    }

    var layer: RasterLayer {
        var layer = RasterLayer(id: id)
        layer.source = id
        layer.rasterOpacity = .constant(0)
        layer.rasterOpacityTransition = StyleTransition(duration: 0, delay: 0)

        return layer
    }

    var source: RasterSource {
        var source = RasterSource()
        source.tiles = [urlTemplate(for: date)]
        source.attribution = "Environment and Climate Change Canada"
        source.tileSize = 1024
        source.volatile = true

        return source
    }

    private func urlTemplate(for date: Date) -> String {
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
        ).string!
    }
}
