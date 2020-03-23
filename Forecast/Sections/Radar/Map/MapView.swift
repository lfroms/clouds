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
    @Binding var timestamps: [Int]
    @Binding var currentImage: Int

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()

        mapView.layoutMargins = UIEdgeInsets(
            top: Dimension.Header.omniBarHeight + (2 * Dimension.Global.padding),
            left: 8,
            bottom: Dimension.Global.padding + 50,
            right: 8
        )

        mapView.delegate = context.coordinator
        mapView.pointOfInterestFilter = .excludingAll
        mapView.showsUserLocation = true
        mapView.showsScale = true
        mapView.showsBuildings = false
        mapView.showsTraffic = false

        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        if timestamps.count < 1 {
            return
        }

        context.coordinator.timestamps = timestamps

        if mapView.overlays.count < 1 {
            mapView.addOverlays(context.coordinator.overlays, level: .aboveRoads)
        }

        mapView.overlays.forEach { overlay in
            mapView.renderer(for: overlay)?.alpha = 0
        }

        mapView.renderer(for: context.coordinator.overlays[currentImage])?.alpha = 0.5
    }

    func makeCoordinator() -> MapView.Coordinator {
        return Coordinator()
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var timestamps: [Int] = [] {
            didSet {
                if oldValue == timestamps {
                    return
                }

                overlays = timestamps.map { timeStamp in
                    RadarTileOverlay(timeStamp: timeStamp)
                }
            }
        }

        var overlays: [RadarTileOverlay] = []

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            guard let tileOverlay = overlay as? MKTileOverlay else {
                return MKOverlayRenderer(overlay: overlay)
            }

            return MKTileOverlayRenderer(tileOverlay: tileOverlay)
        }
    }
}
