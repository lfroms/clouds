//
//  AppState .swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

final class AppState: ObservableObject {
    let activeSectionDidChange = PassthroughSubject<Void, Never>()
    
    @Published private(set) var activeSection: AppSection = .now {
        didSet {
            slidingPanelLocked = activeSection != .now
            
            if oldValue != activeSection {
                activeSectionDidChange.send()
                UISelectionFeedbackGenerator().selectionChanged()
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
    
    private(set) lazy var slidingPanelLocked: Bool = activeSection != .now
    @Published var detailsContentHeight: CGFloat = 0
    
    @Published var showingAlerts: Bool = false
}
