//
//  WeatherLocationItemViewModel.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-25.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CloudsAPI
import CoreLocation
import SwiftUI

final class WeatherLocationItemViewModel: ObservableObject {
    @Published private(set) var weather: CloudsAPI.WeatherLocationItemQuery.Data.Weather?
    @Published private(set) var loading: Bool = false

    func fetch(coordinate: CLLocationCoordinate2D) {
        if !loading {
            loading = true
        }

        CloudsAPI.Client.shared.fetchWeatherLocationItem(latitude: coordinate.latitude, longitude: coordinate.longitude) { result in
            self.loading = false

            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.weather = data.weather
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
