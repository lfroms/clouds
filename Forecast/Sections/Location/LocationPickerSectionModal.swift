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
    @EnvironmentObject private var locationSearchService: LocationSearchService

    var body: some View {
        ZStack {
            if self.$locationPickerState.presented.wrappedValue {
                LocationPickerSection(onDismiss: self.handlePickerDismiss)
                    .equatable()
                    .transition(.move(edge: .bottom))
            }
        }
    }

    private func handlePickerDismiss() {
        locationPickerState.toggleLocationPicker(animated: true)
        locationSearchService.searchQuery.clear()
    }
}

struct LocationPickerSectionModal_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerSectionModal()
    }
}
