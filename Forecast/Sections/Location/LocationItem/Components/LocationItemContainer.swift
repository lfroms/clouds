//
//  LocationItemContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationItemContainer<Content>: View where Content: View {
    let color: Color?
    let action: (() -> Void)?
    let content: () -> Content

    init(color: Color? = nil, action: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.action = action
        self.content = content
    }

    var body: some View {
        Button(action: { self.action?() }) {
            HStack(alignment: .center, spacing: Dimension.Spacing.barItems) {
                content()
            }
            .padding(.horizontal, 20)
            .frame(height: Dimension.LocationPicker.itemHeight)
            .background(color ?? defaultColor)
            .cornerRadius(14)
            .animation(AnimationPreset.Touch.shrink)
        }
    }

    private var defaultColor: Color {
        Color(white: 0.09)
    }
}

struct LocationItemContainer_Previews: PreviewProvider {
    static var previews: some View {
        LocationItemContainer {
            EmptyView()
        }
    }
}
