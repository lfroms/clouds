//
//  RawLocation.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-19.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct RawLocation: Codable, Hashable {
    let name: String
    let regionName: String
}

extension RawLocation: Equatable {
    static func == (lhs: RawLocation, rhs: RawLocation) -> Bool {
        lhs.name == rhs.name && lhs.regionName == rhs.regionName
    }
}
