//
//  LocationPickerState.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-27.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import MapKit

final class LocationPickerState: NSObject, ObservableObject {
    @Published var searchQuery: String = "" {
        didSet {
            debounce(#selector(search), after: 0.5)
        }
    }
    
    @Published private(set) var locationResults: [Location] = []
    @Published private(set) var loading: Bool = false
    
    @objc private func search() {
        guard !searchQuery.isEmpty else {
            locationResults.removeAll()
            return
        }
        
        loading = true
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchQuery
        
        let search = MKLocalSearch(request: request)
        
        search.start { response, _ in
            guard let mapItems = response?.mapItems else {
                return
            }
            
            let locations = mapItems.compactMap { item -> Location? in
                guard
                    let locality = item.placemark.locality,
                    let state = item.placemark.administrativeArea
                else {
                    return nil
                }
                
                return Location(name: locality, regionName: state, coordinate: item.placemark.coordinate)
            }
            
            DispatchQueue.main.async {
                self.loading = false
                self.locationResults = locations
            }
        }
    }
}
