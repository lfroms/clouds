//
//  RadarMapView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import CloudsAPI
import Mapbox
import SwiftUI

struct RadarMapView: UIViewRepresentable {
    var currentImage: Int
    var dates: [Date]
    var overlayOpacity: Double
    var dataSource: CloudsAPI.RadarProvider
    var activeLocationCoordinates: CLLocationCoordinate2D?
    var lazy: Bool = false

    @State private var loaded: Bool = false

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
        mapView.prefetchesTiles = false
        mapView.attributionButton.tintColor = .gray
        mapView.delegate = context.coordinator

        return mapView
    }

    func updateUIView(_ mapView: MGLMapView, context: Context) {
        guard loaded else {
            return
        }

        if dataSource != context.coordinator.lastDataSource {
            mapView.style?.layers.removeAll(where: { $0.identifier.contains("radar-") })
            context.coordinator.lastDataSource = dataSource
        }

        if let newLocation = activeLocationCoordinates, newLocation != context.coordinator.lastLocation {
            mapView.setCenter(newLocation, animated: true)
            context.coordinator.lastLocation = newLocation
        }

        cleanUpOldLayers(in: mapView)

        if lazy, dates.count > 0 {
            addRasterSource(for: dates[currentImage], to: mapView)
        } else {
            addRasterSources(for: dates, to: mapView)
        }

        showActiveRasterLayer(in: mapView)
    }

    private func cleanUpOldLayers(in mapView: MGLMapView) {
        let identifiersToKeep = dates.compactMap { identifier(for: $0) }

        mapView.style?.sources.forEach { source in
            if source.identifier.contains("radar"), !identifiersToKeep.contains(source.identifier) {
                mapView.style?.removeSource(source)
            }
        }

        mapView.style?.layers.removeAll {
            $0.identifier.contains("radar") && !identifiersToKeep.contains($0.identifier)
        }
    }

    private func addRasterSource(for date: Date, to mapView: MGLMapView, visibleInitially: Bool = true) {
        let layerIdentifier = identifier(for: date)

        if mapView.style?.source(withIdentifier: layerIdentifier) == nil {
            switch dataSource {
            case .environmentCanada:
                let source = EnvironmentCanadaRasterTileSource(identifier: layerIdentifier, date: date)
                mapView.style?.addSource(source)
            default:
                let source = RainviewerRasterTileSource(identifier: layerIdentifier, date: date)
                mapView.style?.addSource(source)
            }
        }

        if mapView.style?.layer(withIdentifier: layerIdentifier) == nil,
            let source = mapView.style?.source(withIdentifier: layerIdentifier) {
            let rasterLayer = MGLRasterStyleLayer(identifier: layerIdentifier, source: source)
            rasterLayer.rasterOpacity = NSExpression(forConstantValue: visibleInitially ? overlayOpacity : 0)
            rasterLayer.rasterOpacityTransition = MGLTransition(duration: 0, delay: 0)

            mapView.style?.addLayer(rasterLayer)
        }
    }

    private func addRasterSources(for dates: [Date], to mapView: MGLMapView) {
        dates.enumerated().reversed().forEach { index, date in
            addRasterSource(for: date, to: mapView, visibleInitially: index == currentImage)
        }
    }

    private func showActiveRasterLayer(in mapView: MGLMapView) {
        guard let currentTimestamp = dates[safe: currentImage] else {
            return
        }

        let currentIdentifier = identifier(for: currentTimestamp)

        if let currentLayer = rasterLayer(withIdentifier: currentIdentifier, in: mapView) {
            currentLayer.rasterOpacity = NSExpression(forConstantValue: overlayOpacity)
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
        "radar-\(date.timeIntervalSince1970)-\(dataSource.rawValue)"
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(loaded: $loaded)
    }

    class Coordinator: NSObject, MGLMapViewDelegate {
        var lastDataSource: CloudsAPI.RadarProvider?
        var lastLocation: CLLocationCoordinate2D?

        @Binding var loaded: Bool

        init(loaded: Binding<Bool>) {
            self._loaded = loaded
        }

        func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
            loaded = true
        }
    }
}

extension RadarMapView: Equatable {
    static func == (lhs: RadarMapView, rhs: RadarMapView) -> Bool {
        lhs.currentImage == rhs.currentImage
            && lhs.dates == rhs.dates
            && lhs.activeLocationCoordinates == rhs.activeLocationCoordinates
            && lhs.overlayOpacity == rhs.overlayOpacity
            && lhs.dataSource == rhs.dataSource
            && lhs.lazy == rhs.lazy
    }
}
