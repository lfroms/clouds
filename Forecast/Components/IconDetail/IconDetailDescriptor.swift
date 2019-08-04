//
//  IconDetailDescriptor.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation

struct IconDetailDescriptor: Identifiable {
    let id = UUID()

    let symbolName: String
    let text: String
}
