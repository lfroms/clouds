//
//  OmniBar.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBar: View {
    @State var textFieldValue: String = ""

    var isReadOnly: Bool = false
    var primaryIcon: String

    var settingsButtonAction: (() -> Void)?

    var body: some View {
        ZStack {
            ShadowView(radius: 20, opacity: 0.3, color: .black, cornerRadius: 22)

            BlurView(style: .regular, tint: 0.3)
                .cornerRadius(26)

            HStack(alignment: .center, spacing: 12) {
                Image(systemName: primaryIcon)

                OmniBarTextField(placeholder: OmniBarPlaceholder(), text: $textFieldValue)
                    .disabled(isReadOnly)

                Spacer()

                OmniBarSettingsButton(action: handleSettingsButtonAction)
            }
            .font(Font.callout.weight(.bold))
            .padding(.horizontal, 20)
        }
        .foregroundColor(.white)
        .frame(height: 52)
    }

    private func handleSettingsButtonAction() {
        guard let settingsButtonAction = settingsButtonAction else {
            return
        }

        settingsButtonAction()
    }
}

struct OmniBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue

            OmniBar(primaryIcon: "location.fill")
                .padding(20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
