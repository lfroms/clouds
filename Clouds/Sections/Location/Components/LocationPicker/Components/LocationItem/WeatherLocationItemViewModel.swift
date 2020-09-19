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

    private let client = CloudsAPI.Client()

    func fetch(coordinate: CLLocationCoordinate2D) {
        if !loading {
            loading = true
        }

        let query = CloudsAPI.WeatherLocationItemQuery(latitude: coordinate.latitude, longitude: coordinate.longitude)

        _ = client.fetch(query: query, cachePolicy: .returnCacheDataAndFetch) { result in
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
