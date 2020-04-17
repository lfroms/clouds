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
    @Binding var timestamps: [Double]
    @Binding var currentImage: Int

    func makeUIView(context: Context) -> MGLMapView {
        let url = URL(string: "mapbox://styles/lfroms/ck94ggph90nn61invox6h6207")
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
        mapView.maximumZoomLevel = 7

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
            let source = EnvironmentCanadaRasterTileSource(identifier: currentIdentifier, date: Date(seconds: currentTimestamp))
            let rasterLayer = MGLRasterStyleLayer(identifier: currentIdentifier, source: source)

            rasterLayer.rasterOpacity = NSExpression(forConstantValue: 0.75)

            mapView.style?.addSource(source)
            mapView.style?.addLayer(rasterLayer)

        } else {
            mapView.style?.layer(withIdentifier: currentIdentifier)?.isVisible = true
        }
    }
}
