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
    let iconCodeDidChange = PassthroughSubject<Void, Never>()
    
    @Published var masterViewIconCode: Int = 6 {
        didSet {
            guard oldValue != masterViewIconCode else {
                return
            }
            
            self.iconCodeDidChange.send()
        }
    }
    
    // MARK: - Sliding Panel
    
    @Published var activeTabIndex: Int = 0 {
        didSet {
            slidingPanelLocked = activeTabIndex != 0
        }
    }
    
    @Published var detailsContentHeight: CGFloat = 0
    
    private(set) var slidingPanelLocked: Bool = false
    
    // MARK: - Location Picker
    
    @Published var showingLocationPicker: Bool = false
    
    func toggleLocationPicker(animated: Bool) {
        guard animated else {
            showingLocationPicker.toggle()
            return
        }
        
        withAnimation(.spring()) {
            self.showingLocationPicker.toggle()
        }
    }
    
    @Published var favoriteLocations: [Location] = UserSettings.getFavoriteLocations() {
        didSet {
            UserSettings.saveFavoriteLocations(newLocations: favoriteLocations)
        }
    }
    
    // MARK: - Settings Sheet
    
    @Published var showingSettingsSheet: Bool = false
}
