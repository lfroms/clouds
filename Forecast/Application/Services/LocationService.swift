//
//  LocationService.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-10.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import CoreLocation
import Foundation

class LocationService: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()

    let locationDidChange = PassthroughSubject<Void, Never>()

    override init() {
        super.init()

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.distanceFilter = 1_000 // m
        self.locationManager.startUpdatingLocation()
    }

    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    @Published var lastPlacemark: CLPlacemark? {
        didSet {
            if oldValue != self.lastPlacemark {
                self.locationDidChange.send()
            }
        }
    }

    private func coordinateForCurrentLocation() -> Coordinate? {
        guard let lastLocation = lastLocation else {
            return nil
        }

        return Coordinate(
            latitude: lastLocation.coordinate.latitude,
            longitude: lastLocation.coordinate.longitude
        )
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.lastLocation = location

        self.getPlace(for: location) { placemark in
            guard let placemark = placemark else {
                return
            }

            self.lastPlacemark = placemark
        }

        print(#function, location)
    }
}

extension LocationService {
    func getPlace(for location: CLLocation, completion: @escaping (CLPlacemark?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in

            guard error == nil else {
                print("*** Error in \(#function): \(error!.localizedDescription)")
                completion(nil)
                return
            }

            guard let placemark = placemarks?[0] else {
                print("*** Error in \(#function): placemark is nil")
                completion(nil)
                return
            }

            completion(placemark)
        }
    }
}
