//
//  LocationItem.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-19.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationItem<Content: View>: View {
    var color: Color
    var action: () -> Void
    var content: () -> Content

    @inlinable init(color: Color? = nil, action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.color = color ?? Color(white: 0.09)
        self.action = action
        self.content = content
    }

    var body: some View {
        Button(action: self.action) {
            HStack(alignment: .center, spacing: Dimension.Spacing.barItems) {
                content()
            }
            .padding(.horizontal, 20)
            .frame(height: Dimension.LocationPicker.itemHeight)
            .background(color)
            .cornerRadius(14)
            .animation(AnimationPreset.Touch.shrink)
        }
        .buttonStyle(PlainButtonStyle())
        .accessibility(identifier: "locationpicker.item")
    }
}

struct LocationItemButton_Previews: PreviewProvider {
    static var previews: some View {
        LocationItem(action: {}) {
            Text("Test")
        }
    }
}
