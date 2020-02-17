//
//  OmniBar.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBar: View {
    @Binding var textFieldValue: String

    var isReadOnly: Bool = false
    var primaryIcon: String
    var auxiliaryIcon: String

    var auxiliaryButtonAction: (() -> Void)?
    var barFocusAction: (() -> Void)?

    @State private var isPressed: Bool = false

    var body: some View {
        ZStack {
            ShadowView(radius: 20, opacity: 0.3, color: .black, cornerRadius: 22)

            BlurView(style: .light, tint: 0.3)
                .cornerRadius(26)

            HStack(alignment: .center, spacing: 12) {
                Image(systemName: primaryIcon)

                OmniBarTextField(placeholder: OmniBarPlaceholder(), text: $textFieldValue)
                    .disabled(isReadOnly)

                Spacer()

                OmniBarAuxiliaryButton(icon: auxiliaryIcon, action: handleAuxiliaryButtonAction)
            }
            .font(Font.callout.weight(.bold))
            .padding(.horizontal, 20)
        }
        .foregroundColor(.white)
        .frame(height: Dimension.Header.omniBarHeight)
        .gesture(gesture)
        .scaleEffect(scaleEffect)
        .animation(scaleAnimation)
    }

    private var scaleAnimation: Animation? {
        isReadOnly ? .easeInOut(duration: 0.2) : nil
    }

    private var scaleEffect: CGFloat {
        isPressed ? 0.95 : 1.0
    }

    private var gesture: _EndedGesture<_ChangedGesture<DragGesture>>? {
        guard isReadOnly else {
            return nil
        }

        return DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged { _ in
                self.isPressed = true
            }.onEnded { _ in
                self.isPressed = false
                self.barFocusAction?()
            }
    }

    private func handleAuxiliaryButtonAction() {
        guard let auxiliaryButtonAction = auxiliaryButtonAction else {
            return
        }

        auxiliaryButtonAction()
    }
}

struct OmniBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue

            OmniBar(textFieldValue: .constant("Test value"), primaryIcon: "location.fill", auxiliaryIcon: "slider.horizontal.3")
                .padding(20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
