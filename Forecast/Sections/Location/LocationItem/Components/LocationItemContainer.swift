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
    let content: () -> Content

    init(color: Color? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.content = content
    }

    var body: some View {
        HStack(alignment: .center, spacing: Dimension.Spacing.barItems) {
            content()
        }
        .padding(.horizontal, 20)
        .frame(height: Dimension.LocationPicker.itemHeight)
        .background(color)
        .cornerRadius(14)
    }

    private var defaultColor: Color {
        Color(white: 0.23)
    }
}

struct LocationItemContainer_Previews: PreviewProvider {
    static var previews: some View {
        LocationItemContainer() {
            EmptyView()
        }
    }
}
