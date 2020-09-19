//
//  WeatherService.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Bugsnag
import CloudsAPI
import Combine
import CoreLocation
import Foundation
import SwiftUI

class WeatherService: ObservableObject {
    @Published private(set) var weather: CloudsAPI.WeatherQuery.Data.Weather?
    @Published private(set) var loading: Bool = false

    func fetch(selectedLocation: CLLocationCoordinate2D?, userLocation: CLLocationCoordinate2D?) {
        var latitude: Double?
        var longitude: Double?

        if let selectedLocation = selectedLocation {
            latitude = selectedLocation.latitude
            longitude = selectedLocation.longitude
        } else if let userLocation = userLocation {
            latitude = userLocation.latitude
            longitude = userLocation.longitude
        }

        guard latitude != nil, longitude != nil else {
            return
        }

        loading = true

        CloudsAPI.Client.shared.fetchWeather(latitude: latitude!, longitude: longitude!) { result in
            self.loading = false

            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.weather = data.weather
                }

                if let error = graphQLResult.errors?.first {
                    SystemAlert.display(title: "Error", message: error.description)
                }

            case .failure(let error):
                let exception = NSException(name: NSExceptionName("CloudsNetworkError"), reason: error.localizedDescription)

                Bugsnag.notify(exception) { event in
                    event.context = "Main Weather Query"
                    event.addMetadata(latitude, key: "latitude", section: "weather")
                    event.addMetadata(longitude, key: "longitude", section: "weather")
                    return true
                }

                guard !error.localizedDescription.contains("cancelled") else {
                    return
                }

                SystemAlert.display(title: "Oops!", message: "Something broke. Make sure your device is online and try again.")
            }
        }
    }
}
