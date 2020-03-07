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
}
