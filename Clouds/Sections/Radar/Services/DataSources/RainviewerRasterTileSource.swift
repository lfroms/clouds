//
//  RainviewerRasterTileSource.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import MapboxMaps

final class RainviewerRasterTileSource {
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
        source.attribution = "RainViewer"
        source.tileSize = 512

        return source
    }

    private func urlTemplate(for date: Date) -> String {
        let timestamp = Int(date.timeIntervalSince1970)
        return "https://tilecache.rainviewer.com/v2/radar/\(timestamp)/512/{z}/{x}/{y}/4/0_0.png"
    }
}
