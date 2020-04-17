//
//  MapView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Mapbox
import SwiftUI

struct MapView: UIViewRepresentable {
    @Binding var timestamps: [Int]
    @Binding var currentImage: Int

    func makeUIView(context: Context) -> MGLMapView {
        let url = URL(string: "mapbox://styles/lfroms/ck93iwg0y36jw1imnqmoe495o")
        let mapView = MGLMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = true
        mapView.styleURL = url
        mapView.setCenter(CLLocationCoordinate2D(latitude: 45.5, longitude: -75.5), zoomLevel: 9, animated: false)

        mapView.contentInset = UIEdgeInsets(
            top: Dimension.Header.omniBarHeight + (2 * Dimension.Global.padding),
            left: 8,
            bottom: Dimension.Global.padding + 50,
            right: 8
        )

        mapView.showsScale = true
        mapView.showsUserLocation = true

        return mapView
    }

    func updateUIView(_ mapView: MGLMapView, context: Context) {
        guard
            let currentTimestamp = timestamps[safe: currentImage],
            let lastTimestamp = timestamps.last
        else {
            return
        }

        let currentIdentifier = "radar-\(currentTimestamp)"
        let previousTimestamp = timestamps[safe: currentImage - 1] ?? lastTimestamp
        let previousIdentifier = "radar-\(previousTimestamp)"

        mapView.style?.layer(withIdentifier: previousIdentifier)?.isVisible = false

        if mapView.style?.source(withIdentifier: currentIdentifier) == nil,
            mapView.style?.layer(withIdentifier: currentIdentifier) == nil {
            let source = MGLRasterTileSource(
                identifier: currentIdentifier,
                tileURLTemplates: ["https://tilecache.rainviewer.com/v2/radar/\(currentTimestamp)/512/{z}/{x}/{y}/6/1_0.png"],
                options: [.tileSize: 512]
            )

            let rasterLayer = MGLRasterStyleLayer(identifier: currentIdentifier, source: source)

            mapView.style?.addSource(source)
            mapView.style?.addLayer(rasterLayer)

        } else {
            mapView.style?.layer(withIdentifier: currentIdentifier)?.isVisible = true
        }
    }
}
