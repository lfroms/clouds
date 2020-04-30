//
//  Comparable+Clamped.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-09-14.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
