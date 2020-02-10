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
        ZStack(alignment: Alignment.topLeading) {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)

            DismissableScrollView(didPerformDismiss: handlePickerDismiss) {
                VStack(alignment: .leading, spacing: 10) {
                    LabeledSection(label: "Current location") {
                        VStack(spacing: 10) {
                            LocationItem(icon: "location.fill", title: "Ottawa (Kanada – Orléans")
                        }
                    }
                    .padding(.vertical, 10)
                }
                .padding(.horizontal, 20)
            }
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
