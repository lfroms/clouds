//
//  LocationPickerSection.swift
//  Forecast
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
                .clipShape(RoundedCornerShape(cornerRadius: 22, style: .continuous, corners: [.topLeft, .topRight]))
                .edgesIgnoringSafeArea(.all)

            ScrollView(.vertical) {
                LocationPickerContainer()
            }
            .onDismiss(message: "Release to Dismiss", perform: self.onDismiss)
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

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerSection(onDismiss: {})
    }
}
