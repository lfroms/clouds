//
//  TabDescriptor.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

struct TabDescriptor {
    let index: Int
    let text: String
    let isActive: Bool

    let tabWasSelected: (_ index: Int) -> Void
}
