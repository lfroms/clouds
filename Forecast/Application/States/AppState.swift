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
    
    @Published var activeSection: AppSection = .now {
        didSet {
            slidingPanelLocked = activeSection != .now
            
            if oldValue != activeSection {
                activeSectionDidChange.send()
            }
        }
    }
    
    @Published var detailsContentHeight: CGFloat = 0
    
    private(set) var slidingPanelLocked: Bool = false
}
