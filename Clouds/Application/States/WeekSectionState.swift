//
//  WeekSectionState.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-07.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

final class WeekSectionState: ObservableObject {
    @Published var dayIndex: Int = 0
    @Published var dragging: Bool = false
    @Published var showingNightConditions: Bool = false
}
