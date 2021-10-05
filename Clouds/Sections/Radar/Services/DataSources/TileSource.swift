//
//  TileSource.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2021-10-04.
//  Copyright © 2021 Lukas Romsicki. All rights reserved.
//

import Foundation
import MapboxMaps

protocol TileSource {
    var source: RasterSource { get }
    var layer: RasterLayer { get }
}
