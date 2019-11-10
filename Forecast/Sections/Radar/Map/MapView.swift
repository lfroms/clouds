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

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {}
}
