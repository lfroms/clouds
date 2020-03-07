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
    // MARK: - Icon Code
    
    let iconCodeDidChange = PassthroughSubject<Void, Never>()
    
    @Published private(set) var iconCode: Int = 6 {
        didSet {
            self.iconCodeDidChange.send()
        }
    }
    
    func setIconCode(to newCode: Int?, animated: Bool) {
        guard iconCode != newCode else {
            return
        }
        
        let newCode: Int = newCode ?? 0
        
        guard animated else {
            iconCode = newCode
            return
        }
        
        withAnimation(.spring()) {
            self.iconCode = newCode
        }
    }
    
    // MARK: - Sliding Panel
    
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
    
    // MARK: - Settings Sheet
    
    @Published var showingSettingsSheet: Bool = false
}
