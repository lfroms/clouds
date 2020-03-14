//
//  LocationPickerSectionModal.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPickerSectionModal: View {
    @EnvironmentObject private var locationPickerState: LocationPickerState

    var body: some View {
        LocationPickerSection(onDismiss: self.handlePickerDismiss)
            .equatable()
            .offset(searchOffset)
    }

    private var searchOffset: CGSize {
        return CGSize(width: 0, height: locationPickerState.presented ? 0 : Dimension.System.screenHeight)
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
