//
//  TimestampStore.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Combine
import Foundation

final class TimestampStore: ObservableObject {
    private static let urlSource: String = "https://tilecache.rainviewer.com/api/maps.json"
    
    @Published var timestamps: [Int] = []
    
    private var getRadarTimestampsCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    deinit {
        getRadarTimestampsCancellable?.cancel()
    }
    
    init() {
        getRadarTimestamps()
    }
    
    func getRadarTimestamps() {
        guard let url = URL(string: Self.urlSource) else {
            return
        }
        
        let request = URLRequest(url: url)
        
        getRadarTimestampsCancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [Int].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.timestamps, on: self)
    }
}
