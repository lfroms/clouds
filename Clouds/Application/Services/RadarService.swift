//
//  RadarService.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-04-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Bugsnag
import CloudsAPI
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

    private let client = CloudsAPI.Client()

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
        timerCancellable?.cancel()
    }

    // MARK: - Timestamps

    @Published var dates: [Date] = []
    @Published var loading: Bool = false

    func getRadarTimestamps(for provider: CloudsAPI.RadarProvider) {
        loading = true

        let query = CloudsAPI.RadarTimestampsQuery(provider: provider)

        _ = client.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.dates = data.radarTimestamps.compactMap { Date(seconds: $0) }
                    self.loading = false
                    self.currentImageIndex = self.dates.count - 1
                }

                if let error = graphQLResult.errors?.first {
                    SystemAlert.display(title: "Error", message: error.description)
                }

            case .failure(let error):
                let exception = NSException(name: NSExceptionName("CloudsNetworkError"), reason: error.localizedDescription)

                Bugsnag.notify(exception) { event in
                    event.context = "Radar Timestamps Query"
                    return true
                }

                guard !error.localizedDescription.contains("cancelled") else {
                    return
                }

                SystemAlert.display(title: "Oops!", message: "Something broke. Make sure your device is online and try again.")
            }
        }
    }
}
