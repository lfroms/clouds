//
//  ObservedAtData.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct ObservedAtData {
    var loading: Bool
    private var timestamp: UnixTimestamp?
    var action: () -> Void

    init(loading: Bool, timestamp: UnixTimestamp?, action: @escaping () -> Void) {
        self.loading = loading
        self.timestamp = timestamp
        self.action = action
    }

    var date: Date? {
        guard let timestamp = timestamp else {
            return nil
        }

        return Date(seconds: TimeInterval(timestamp))
    }
}

extension ObservedAtData: Equatable {
    static func == (lhs: ObservedAtData, rhs: ObservedAtData) -> Bool {
        lhs.loading == rhs.loading && lhs.timestamp == rhs.timestamp
    }
}