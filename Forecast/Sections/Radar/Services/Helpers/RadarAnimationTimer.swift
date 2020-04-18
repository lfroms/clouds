//
//  RadarAnimationTimer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

class RadarAnimationTimer {
    let publisher = Timer.publish(every: 0.4, on: .main, in: .default)
    private var timerCancellable: Cancellable?

    func start() {
        self.timerCancellable = self.publisher.connect()
    }

    func cancel() {
        self.timerCancellable?.cancel()
    }
}
