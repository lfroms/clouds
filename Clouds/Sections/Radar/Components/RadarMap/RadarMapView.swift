//
//  RadarMapView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import CloudsAPI
import MapboxMaps
import SwiftUI

struct RadarMapView: UIViewRepresentable {
    var currentImage: Int
    var dates: [Date]
    var overlayOpacity: Double
    var dataSource: CloudsAPI.RadarProvider
    var activeLocationCoordinates: CLLocationCoordinate2D?

    func makeUIView(context: Context) -> MapView {
        let mapInitOptions = MapInitOptions(
            cameraOptions: CameraOptions(
                center: activeLocationCoordinates,
                zoom: 5
            ),
            styleURI: StyleURI(rawValue: "mapbox://styles/lfroms/ck94ggph90nn61invox6h6207")!
        )

        let mapView = MapView(frame: .zero, mapInitOptions: mapInitOptions)
        mapView.translatesAutoresizingMaskIntoConstraints = true

        let topContentInset: CGFloat = Dimension.Header.omniBarHeight + Dimension.System.topSafeMargin + (2 * Dimension.Global.padding)
        let edgeContentInset: CGFloat = Dimension.Global.padding

        mapView.ornaments.options.scaleBar.margins = CGPoint(x: edgeContentInset, y: topContentInset)
        mapView.ornaments.options.scaleBar.visibility = .visible
        mapView.ornaments.options.compass.margins = CGPoint(x: edgeContentInset, y: topContentInset)
        mapView.ornaments.options.logo.margins = CGPoint(x: 16, y: 16)
        mapView.ornaments.options.attributionButton.margins = CGPoint(x: 8, y: 16)

        try? mapView.mapboxMap.setCameraBounds(with: CameraBoundsOptions(maxZoom: 7))
        mapView.location.options.puckType = .puck2D()

        mapView.mapboxMap.onNext(event: .mapLoaded) { _ in
            let style = mapView.mapboxMap.style

            addRasterSourceLayers(for: style)
            updateOpacityOfActiveLayer(for: style)
        }

        return mapView
    }

    func updateUIView(_ mapView: MapView, context: Context) {
        let style = mapView.mapboxMap.style

        updateCameraOnLocationChange(in: mapView, context: context)
        addRasterSourceLayers(for: style)
        updateOpacityOfActiveLayer(for: style)
    }

    private func updateCameraOnLocationChange(in mapView: MapView, context: Context) {
        if let newLocation = activeLocationCoordinates, newLocation != context.coordinator.lastLocation {
            mapView.camera.ease(to: CameraOptions(center: newLocation), duration: 0.4)
            context.coordinator.lastLocation = newLocation
        }
    }

    private func addRasterSourceLayers(for style: Style) {
        if let currentDate = currentDate {
            addTileSource(for: currentDate, to: style)
        }

        if let nextDate = nextDate {
            addTileSource(for: nextDate, to: style)
        }

        if let previousDate = previousDate {
            addTileSource(for: previousDate, to: style)
        }
    }

    private func updateOpacityOfActiveLayer(for style: Style) {
        guard let currentDate = dates[safe: currentImage] else {
            return
        }

        radarLayerIdentifiers(for: style).forEach { layerInfo in
            try? style.updateLayer(withId: layerInfo.id, type: RasterLayer.self) { (layer: inout RasterLayer) in
                let layerVisible = layerInfo.id == identifier(for: currentDate)

                layer.rasterOpacity = .constant(layerVisible ? overlayOpacity : 0)
            }
        }
    }

    private func addTileSource(for date: Date, to style: Style) {
        let id = identifier(for: date)

        if dataSource == .environmentCanada {
            let tileSource = EnvironmentCanadaRasterTileSource(id: id, date: date)
            try? style.addSource(tileSource.source, id: id)
            try? style.addLayer(tileSource.layer, layerPosition: .below("puck"))
        }

        if dataSource == .rainviewer {
            let tileSource = RainviewerRasterTileSource(id: id, date: date)
            try? style.addSource(tileSource.source, id: id)
            try? style.addLayer(tileSource.layer, layerPosition: .below("puck"))
        }
    }

    private func radarLayerIdentifiers(for style: Style) -> [LayerInfo] {
        style.allLayerIdentifiers.filter { layerInfo in
            layerInfo.id.starts(with: "radar-")
        }
    }

    private var previousDate: Date? {
        dates[safe: currentImage - 1] ?? dates.last
    }

    private var currentDate: Date? {
        dates[safe: currentImage]
    }

    private var nextDate: Date? {
        dates[safe: currentImage + 1] ?? dates.first
    }

    private func identifier(for date: Date) -> String {
        "radar-\(date.timeIntervalSince1970)-\(dataSource.rawValue)"
    }
}

extension RadarMapView {
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject {
        var lastLocation: CLLocationCoordinate2D?
    }
}

extension RadarMapView: Equatable {
    static func == (lhs: RadarMapView, rhs: RadarMapView) -> Bool {
        lhs.currentImage == rhs.currentImage
            && lhs.dates == rhs.dates
            && lhs.activeLocationCoordinates == rhs.activeLocationCoordinates
            && lhs.overlayOpacity == rhs.overlayOpacity
            && lhs.dataSource == rhs.dataSource
    }
}
