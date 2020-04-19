//
//  RadarService.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Apollo
import Combine
import SwiftUI

final class RadarService: ObservableObject {
    // MARK: - Animation
    
    @Published var currentImageIndex: Int = 0
    @Published var isPlaying: Bool = false
    
    private let timer = RadarAnimationTimer()
    
    private var timerCancellable: AnyCancellable? {
        didSet { oldValue?.cancel() }
    }
    
    private func runAnimation() {
        let newIndex = currentImageIndex + 1
        currentImageIndex = newIndex >= dates.count ? 0 : newIndex
    }
    
    init() {
        timer.start()
        
        timerCancellable = timer.publisher
            .receive(on: RunLoop.main)
            .sink { _ in
                if self.isPlaying {
                    self.runAnimation()
                }
            }
    }
    
    deinit {
        apolloCancellable?.cancel()
        timerCancellable?.cancel()
    }
    
    // MARK: - Timestamps
    
    @Published var dates: [Date] = []
    
    private var apolloCancellable: Apollo.Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    func getRadarTimestamps() {
        let query = RadarTimestampsQuery(provider: .msc)
        
        apolloCancellable = GraphQL.shared.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.dates = data.radarTimestamps.compactMap { Date(seconds: $0) }
                    self.currentImageIndex = self.dates.count - 1
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
