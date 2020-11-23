//
//  WidgetLocationManager.swift
//  CloudsWidgetExtension
//
//  Created by Lukas Romsicki on 2020-11-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CoreLocation

class WidgetLocationManager: NSObject, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager?
    private var handler: ((CLLocation?) -> Void)?

    override init() {
        super.init()

        DispatchQueue.main.async {
            self.locationManager = CLLocationManager()
            self.locationManager?.delegate = self
            self.locationManager?.desiredAccuracy = kCLLocationAccuracyThreeKilometers

            if self.locationManager?.authorizationStatus == .notDetermined {
                self.locationManager?.requestWhenInUseAuthorization()
            }
        }
    }

    func fetchLocation(handler: @escaping (CLLocation?) -> Void) {
        self.handler = handler
        locationManager?.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        handler?(locations.last)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
