//
//  VisualState.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-07.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

final class VisualState: ObservableObject {
    let appearanceDidChange = PassthroughSubject<Void, Never>()
    
    internal typealias Appearance = (style: IconStyle?, scheme: ColorScheme)
    
    @Published private(set) var appearance: Appearance = (nil, .empty) {
        didSet {
            appearanceDidChange.send()
        }
    }
    
    func set(style: IconStyle?, colorScheme: ColorScheme?, animated: Bool) {
        let newAppearance = (style: style, scheme: colorScheme ?? .empty)
        
        guard newAppearance != appearance else {
            return
        }
        
        guard animated else {
            appearance = newAppearance
            return
        }
        
        withAnimation(.spring()) {
            appearance = newAppearance
        }
    }
}
