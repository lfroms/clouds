//
//  LocationSearchService.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-02-27.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Bugsnag
import Combine
import MapKit

final class LocationSearchService: NSObject, ObservableObject {
    @Published var searchQuery: String = ""
    @Published private(set) var results: [Result] = []

    let completer: MKLocalSearchCompleter
    var cancellable: AnyCancellable?

    override init() {
        completer = MKLocalSearchCompleter()
        super.init()
        completer.resultTypes = .address

        cancellable = $searchQuery
            .removeDuplicates()
            .sink {
                if $0.isEmpty {
                    self.results = []
                } else {
                    self.completer.queryFragment = $0
                }
            }

        completer.delegate = self
    }

    struct Result: Equatable, Hashable {
        let title: String
        let subtitle: String

        init(completion: MKLocalSearchCompletion) {
            title = completion.title.trimmingCharacters(in: .whitespacesAndNewlines)
            subtitle = completion.subtitle.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
}

extension LocationSearchService: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        results = completer.results
            .filter {
                $0.subtitle.components(separatedBy: ",").count - 1 < 2
                    && $0.subtitle.contains("Canada")
            }
            .compactMap {
                Result(completion: $0)
            }
    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        Bugsnag.notifyError(error) { event in
            event.context = "Location Search"
            return true
        }

        SystemAlert.display(title: "Error", message: error.localizedDescription)
    }
}
