//
//  LocationPickerSection.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPickerSection: View {
    var onDismiss: () -> Void

    var body: some View {
        ZStack(alignment: .topLeading) {
            BlackBackground()
                .clipShape(RoundedCornerShape(cornerRadius: Dimension.Global.cornerRadius, style: .continuous, corners: [.topLeft, .topRight]))
                .ignoresSafeArea(.container)

            ScrollView(.vertical) {
                LocationPicker()
                    .equatable()
            }
            .modifier(DismissableScrollViewModifier(message: "Release to Dismiss", dismissAction: onDismiss))
            .padding(.top, topInset)
        }
    }

    private var topInset: CGFloat {
        (2 * Dimension.Global.padding) + Dimension.Header.omniBarHeight
    }
}

extension LocationPickerSection: Equatable {
    static func == (lhs: LocationPickerSection, rhs: LocationPickerSection) -> Bool {
        false
    }
}

struct LocationPickerSection_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerSection(onDismiss: {})
    }
}
