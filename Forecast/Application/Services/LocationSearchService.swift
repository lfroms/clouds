//
//  LocationSearchService.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-27.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import MapKit

final class LocationSearchService: NSObject, ObservableObject {
    @Published var searchQuery: String = "" {
        didSet {
            debounce(#selector(search), after: 0.5)
        }
    }
    
    @Published private(set) var results: [Location] = []
    @Published private(set) var loading: Bool = false
    
    @objc private func search() {
        guard !searchQuery.isEmpty else {
            results.removeAll()
            return
        }
        
        loading = true
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchQuery
        request.resultTypes = .address
        
        let search = MKLocalSearch(request: request)
        
        search.start { response, _ in
            DispatchQueue.main.async {
                self.loading = false
            }
            
            guard let mapItems = response?.mapItems else {
                return
            }
            
            let locations = mapItems.compactMap { item -> Location? in
                guard let locality = item.placemark.locality else {
                    return nil
                }
                
                let regionName = LocationNameHelper.shared.createRegionNameFrom(placemark: item.placemark)
                return Location(name: locality, regionName: regionName, coordinate: item.placemark.coordinate)
            }
            
            DispatchQueue.main.async {
                self.results = locations
            }
        }
    }
}
