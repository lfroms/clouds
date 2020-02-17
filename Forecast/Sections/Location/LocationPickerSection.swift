//
//  LocationPickerSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPickerSection: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        ZStack(alignment: .topLeading) {
            BlackBackground()
                .clipShape(RoundedCornerShape(cornerRadius: 22, style: .continuous, corners: [.topLeft, .topRight]))
                .edgesIgnoringSafeArea(.all)

            LocationPicker(didPerformDismiss: self.handlePickerDismiss)
        }
    }

    private func handlePickerDismiss() {
        self.appState.toggleLocationPicker(animated: true)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerSection()
    }
}
