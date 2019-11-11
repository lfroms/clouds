//
//  RadarTileOverlay.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import MapKit

final class RadarTileOverlay: MKTileOverlay {
    let timeStamp: Int
    private(set) var isRendered: Bool = false

    init(timeStamp: Int) {
        self.timeStamp = timeStamp

        super.init(urlTemplate: nil)

        self.tileSize = CGSize(width: 512, height: 512)
    }

    override func url(forTilePath path: MKTileOverlayPath) -> URL {
        let size = Int(tileSize.width)

        var components = URLComponents()
        components.scheme = "https"
        components.host = "tilecache.rainviewer.com"
        components.path = "/v2/radar/\(timeStamp)/\(size)/\(path.z)/\(path.x)/\(path.y)/\(ColorScheme.nextradLevel3.rawValue)/0_1.png"

        return components.url ?? super.url(forTilePath: path)
    }

    private enum ColorScheme: Int {
        case blackAndWhite = 0
        case original = 1
        case universalBlue = 2
        case titan = 3
        case theWeatherChannel = 4
        case meteored = 5
        case nextradLevel3 = 6
        case rainbowSelexIS = 7
    }
}
