//
//  OmniBar.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBar: View, Equatable {
    @State private var isPressed: Bool = false

    @Binding var textFieldValue: String

    var readOnly: Bool
    var primaryIcon: String
    var auxiliaryIcon: String

    var didBecomeActive: () -> Void
    var auxiliaryAction: () -> Void

    var body: some View {
        HStack(alignment: .center, spacing: Dimension.Spacing.barItems) {
            Image(systemName: primaryIcon)
                .equatable()

            OmniBarTextField(text: $textFieldValue, placeholder: OmniBarPlaceholder())
                .equatable()
                .disabled(readOnly)

            OmniBarAuxiliaryButton(icon: auxiliaryIcon, action: auxiliaryAction)
                .equatable()
        }
        .font(Font.callout.weight(.bold))
        .padding(.leading, Dimension.Global.padding)
        .frame(height: Dimension.Header.omniBarHeight)
        .background(ShadowView(radius: 20, opacity: 0.3, color: .black, cornerRadius: 22))
        .background(BlurView(style: .light, tint: 0.3).cornerRadius(26))
        .gesture(gesture)
        .scaleEffect(scaleEffect)
        .animation(scaleAnimation, value: [isPressed])
        .accessibility(identifier: "omnibar")
    }

    // MARK: - Animations & Gestures

    private var scaleAnimation: Animation? {
        readOnly ? AnimationPreset.Touch.shrink : nil
    }

    private var scaleEffect: CGFloat {
        isPressed ? Dimension.Animation.shrinkAmount : .one
    }

    private var gesture: _EndedGesture<_ChangedGesture<DragGesture>>? {
        guard readOnly else {
            return nil
        }

        return DragGesture(minimumDistance: .zero, coordinateSpace: .local)
            .onChanged { _ in
                self.isPressed = true

            }.onEnded { _ in
                self.isPressed = false
                self.didBecomeActive()
            }
    }

    // MARK: - Equatable

    static func == (lhs: OmniBar, rhs: OmniBar) -> Bool {
        lhs.textFieldValue == rhs.textFieldValue
            && lhs.readOnly == rhs.readOnly
            && lhs.primaryIcon == rhs.primaryIcon
            && lhs.auxiliaryIcon == rhs.auxiliaryIcon
    }
}

struct OmniBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue

            OmniBar(
                textFieldValue: .constant("Test"),
                readOnly: false,
                primaryIcon: SFSymbol.magnifyingGlass,
                auxiliaryIcon: SFSymbol.xMarkCircleFilled,
                didBecomeActive: {},
                auxiliaryAction: {}
            )
            .padding(Dimension.Global.padding)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
