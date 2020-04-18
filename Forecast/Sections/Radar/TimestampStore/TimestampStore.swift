//
//  TimestampStore.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Apollo
import Foundation

final class TimestampStore: ObservableObject {
    private static let urlSource: String = "https://tilecache.rainviewer.com/api/maps.json"
    
    @Published var timestamps: [Double] = []
    
    private var cancellable: Apollo.Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func getRadarTimestamps() {
        let query = RadarTimestampsQuery(provider: .msc)
        
        cancellable = GraphQL.shared.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.timestamps = data.radarTimestamps
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
