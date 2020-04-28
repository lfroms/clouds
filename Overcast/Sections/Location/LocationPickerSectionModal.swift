//
//  LocationPickerSectionModal.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPickerSectionModal: View {
    @EnvironmentObject private var locationPickerState: LocationPickerState

    var body: some View {
        ZStack {
            if locationPickerState.presented {
                LocationPickerSection(onDismiss: self.handlePickerDismiss)
                    .equatable()
                    .transition(.move(edge: .bottom))
            }
        }
    }

    private func handlePickerDismiss() {
        locationPickerState.toggleLocationPicker(animated: true)
    }
}

struct LocationPickerSectionModal_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerSectionModal()
    }
}
