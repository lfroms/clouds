//
//  ObservedAt.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-02.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct ObservedAt {
    var loading: Bool

    var timestamp: Int?
    var action: () -> Void
}

extension ObservedAt: Equatable {
    static func == (lhs: ObservedAt, rhs: ObservedAt) -> Bool {
        lhs.loading == rhs.loading && lhs.timestamp == rhs.timestamp
    }
}
