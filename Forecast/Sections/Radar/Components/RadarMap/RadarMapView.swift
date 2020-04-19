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
    var dates: [Date]
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
            left: 8,
            bottom: 8,
            right: 8
        )

        mapView.showsScale = true
        mapView.showsUserLocation = true
        mapView.maximumZoomLevel = 7
        mapView.prefetchesTiles = true
        mapView.attributionButton.tintColor = .gray

        return mapView
    }

    func updateUIView(_ mapView: MGLMapView, context: Context) {
        addRasterSources(for: dates, to: mapView)
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
            rasterLayer.rasterOpacity = NSExpression(forConstantValue: index == currentImage ? 0.75 : 0)
            rasterLayer.rasterOpacityTransition = MGLTransition(duration: 0, delay: 0)

            mapView.style?.addSource(source)
            mapView.style?.addLayer(rasterLayer)
        }
    }

    private func showActiveRasterLayer(in mapView: MGLMapView) {
        guard let currentTimestamp = dates[safe: currentImage] else {
            return
        }

        let currentIdentifier = identifier(for: currentTimestamp)

        if let currentLayer = rasterLayer(withIdentifier: currentIdentifier, in: mapView) {
            currentLayer.rasterOpacity = NSExpression(forConstantValue: 0.75)
            hideAllLayersExcept(currentLayer, in: mapView)
        }
    }

    private func rasterLayer(withIdentifier identifier: String, in mapView: MGLMapView) -> MGLRasterStyleLayer? {
        mapView.style?.layer(withIdentifier: identifier) as? MGLRasterStyleLayer
    }

    private func hideAllLayersExcept(_ layer: MGLRasterStyleLayer, in mapView: MGLMapView) {
        mapView.style?.layers.forEach { layerInStyle in
            let layerHideCandidate = layerInStyle as? MGLRasterStyleLayer

            if layerHideCandidate?.identifier != layer.identifier,
                layerHideCandidate?.rasterOpacity != NSExpression(forConstantValue: 0) {
                layerHideCandidate?.rasterOpacity = NSExpression(forConstantValue: 0)
            }
        }
    }

    private func identifier(for date: Date) -> String {
        "radar-\(date.timeIntervalSince1970)"
    }
}

extension RadarMapView: Equatable {
    static func == (lhs: RadarMapView, rhs: RadarMapView) -> Bool {
        lhs.currentImage == rhs.currentImage
            && lhs.dates == rhs.dates
            && lhs.activeLocationCoordinates == rhs.activeLocationCoordinates
    }
}
