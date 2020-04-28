//
//  LocationSearchService.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-02-27.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import MapKit

final class LocationSearchService: NSObject, ObservableObject {
    @Published var searchQuery: String = "" {
        didSet {
            search()
        }
    }
    
    @Published private(set) var results: [Result] = []
    @Published private(set) var loading: Bool = false
    
    private lazy var searchCompleter: MKLocalSearchCompleter = {
        let searchCompleter = MKLocalSearchCompleter()
        searchCompleter.delegate = self
        searchCompleter.resultTypes = .address
        return searchCompleter
    }()
    
    private func search() {
        guard !searchQuery.isEmpty else {
            results.removeAll()
            return
        }
        
        debounce(#selector(setLoading), after: 0.5)
        searchCompleter.queryFragment = searchQuery
    }
    
    @objc private func setLoading() {
        if searchCompleter.isSearching, !loading {
            loading = true
        }
    }
    
    struct Result: Equatable, Hashable {
        let title: String
        let subtitle: String
        
        init(completion: MKLocalSearchCompletion) {
            let components = completion.title.split(separator: ",", maxSplits: 1, omittingEmptySubsequences: true)
            title = String(components.first ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            subtitle = String(components.last ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
}

extension LocationSearchService: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        if loading {
            loading = false
        }
        
        results = completer.results
            .filter {
                $0.title.contains(",")
                    && $0.subtitle.isEmpty
                    && $0.title.contains("Canada")
            }
            .compactMap {
                Result(completion: $0)
            }
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {}
}
