//
//  AppState .swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftUI

final class AppState: ObservableObject {
    @Published private(set) var activeSection: AppSection = .now {
        didSet {
            slidingPanelLocked = activeSection != .now

            if oldValue != activeSection {
                UISelectionFeedbackGenerator().selectionChanged()
                showingAlerts = false
            }
        }
    }

    func navigateToSection(_ section: AppSection, animated: Bool) {
        guard animated else {
            activeSection = section
            return
        }

        withAnimation(.easeInOut) {
            activeSection = section
        }
    }

    // MARK: - Sliding Panel

    @Published var slidingPanelLocked: Bool = false
    @Published var detailsContentHeight: CGFloat = 0
    @Published var drawerIsOpen: Bool = false

    // MARK: - Alerts

    @Published var showingAlerts: Bool = false
}
