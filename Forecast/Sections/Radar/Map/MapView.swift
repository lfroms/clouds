//
//  MapView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()

        if let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets {
            // TODO: - Store these values as constants or calculate them.
            let topInset = safeAreaInsets.top + 92 + 40
            let layoutMargins = UIEdgeInsets(top: topInset, left: 5, bottom: 20 + 50, right: 5)

            mapView.layoutMargins = layoutMargins
        }

        mapView.delegate = context.coordinator

        let overlay = RadarTileOverlay(timeStamp: 1573418400)
        mapView.addOverlay(overlay, level: .aboveRoads)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {}

    func makeCoordinator() -> MapView.Coordinator {
        return Coordinator()
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            guard let tileOverlay = overlay as? MKTileOverlay else {
                return MKOverlayRenderer(overlay: overlay)
            }

            let overlayRenderer = MKTileOverlayRenderer(tileOverlay: tileOverlay)
            overlayRenderer.alpha = 0.6

            return overlayRenderer
        }
    }
}

final class RadarTileOverlay: MKTileOverlay {
    let timeStamp: Int

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
