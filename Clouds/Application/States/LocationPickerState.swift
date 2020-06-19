//
//  LocationPickerState.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-07.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

final class LocationPickerState: ObservableObject {
    @Published var presented: Bool = false

    func toggleLocationPicker(animated: Bool) {
        guard animated else {
            presented.toggle()
            return
        }

        withAnimation(.spring()) {
            self.presented.toggle()
        }
    }
}
