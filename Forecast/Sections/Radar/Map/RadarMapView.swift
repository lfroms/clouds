//
//  RadarMapView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Mapbox
import SwiftUI

struct RadarMapView: UIViewRepresentable {
    var currentImage: Int
    var timestamps: [Date]
    var activeLocationCoordinates: CLLocationCoordinate2D?

    func makeUIView(context: Context) -> MGLMapView {
        let url = URL(string: "mapbox://styles/lfroms/ck94ggph90nn61invox6h6207")
        let mapView = MGLMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = true
        mapView.styleURL = url

        if let currentCenter = activeLocationCoordinates {
            mapView.setCenter(currentCenter, zoomLevel: 5, animated: false)
        }

        mapView.contentInset = UIEdgeInsets(
            top: Dimension.Header.omniBarHeight + (2 * Dimension.Global.padding),
            left: 12,
            bottom: Dimension.Global.padding + 50,
            right: 12
        )

        mapView.showsScale = true
        mapView.showsUserLocation = true
        mapView.maximumZoomLevel = 7
        mapView.prefetchesTiles = true
        mapView.attributionButton.tintColor = .gray

        return mapView
    }

    func updateUIView(_ mapView: MGLMapView, context: Context) {
        addRasterSources(for: timestamps, to: mapView)
        showActiveRasterLayer(in: mapView)
    }

    private func addRasterSources(for dates: [Date], to mapView: MGLMapView) {
        dates.enumerated().forEach { index, date in
            let layerIdentifier = identifier(for: date)

            guard mapView.style?.source(withIdentifier: layerIdentifier) == nil else {
                return
            }

            let source = EnvironmentCanadaRasterTileSource(identifier: layerIdentifier, date: date)
            let rasterLayer = MGLRasterStyleLayer(identifier: layerIdentifier, source: source)
            rasterLayer.rasterOpacity = NSExpression(forConstantValue: index == 0 ? 0.75 : 0)
            rasterLayer.rasterOpacityTransition = MGLTransition(duration: 0.15, delay: 0)

            mapView.style?.addSource(source)
            mapView.style?.addLayer(rasterLayer)
        }
    }

    private func showActiveRasterLayer(in mapView: MGLMapView) {
        guard
            let currentTimestamp = timestamps[safe: currentImage],
            let lastTimestamp = timestamps.last
        else {
            return
        }

        let currentIdentifier = identifier(for: currentTimestamp)
        let previousTimestamp = timestamps[safe: currentImage - 1] ?? lastTimestamp
        let previousIdentifier = identifier(for: previousTimestamp)

        rasterLayer(withIdentifier: currentIdentifier, in: mapView)?.rasterOpacity = NSExpression(forConstantValue: 0.75)
        rasterLayer(withIdentifier: previousIdentifier, in: mapView)?.rasterOpacity = NSExpression(forConstantValue: 0)
    }

    private func rasterLayer(withIdentifier identifier: String, in mapView: MGLMapView) -> MGLRasterStyleLayer? {
        mapView.style?.layer(withIdentifier: identifier) as? MGLRasterStyleLayer
    }

    private func identifier(for date: Date) -> String {
        "radar-\(date.timeIntervalSince1970)"
    }
}

extension RadarMapView: Equatable {}
