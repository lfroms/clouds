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
        
        didBecomeActiveCancellable = NotificationCenter.default
            .publisher(for: UIApplication.didBecomeActiveNotification)
            .sink(receiveValue: didBecomeActive)
    }
    
    deinit {
        apolloCancellable?.cancel()
        timerCancellable?.cancel()
        didBecomeActiveCancellable?.cancel()
    }
    
    // MARK: - Timestamps
    
    @Published var dates: [Date] = []
    @Published var loading: Bool = false
    
    private var didBecomeActiveCancellable: Combine.Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    private var apolloCancellable: Apollo.Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    private func didBecomeActive(_: Notification) {
        getRadarTimestamps()
    }
    
    func getRadarTimestamps() {
        let query = RadarTimestampsQuery(provider: .msc)
        loading = true
        
        apolloCancellable = GraphQL.shared.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.dates = data.radarTimestamps.compactMap { Date(seconds: $0) }
                    self.loading = false
                    self.currentImageIndex = self.dates.count - 1
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
