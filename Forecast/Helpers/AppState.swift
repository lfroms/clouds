//
//  AppState .swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftUI

final class AppState: ObservableObject {
    @Published var masterViewIconCode: Int = 6
    @Published var detailsContentHeight: CGFloat = 0

    @Published var activeTabIndex: Int = 0 {
        didSet {
            slidingPanelLocked = activeTabIndex != 0
        }
    }

    @Published var slidingPanelLocked: Bool = false
}
