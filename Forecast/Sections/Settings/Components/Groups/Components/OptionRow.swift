//
//  OptionRow.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OptionRow<Content: View>: View {
    private var symbolName: String
    private var color: Color
    private var label: String
    private var content: () -> Content

    @inlinable init(
        symbolName: String,
        color: Color,
        label: String,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.symbolName = symbolName
        self.color = color
        self.label = label
        self.content = content
    }

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(color)
                .frame(width: 30, height: 30)
                .overlay(Image(systemName: symbolName))

            Text(label)
                .font(.body)
                .fontWeight(.semibold)

            Spacer(minLength: 0)

            content()
        }
        .foregroundColor(.white)
        .font(Font.body.weight(.semibold))
    }
}

struct OptionRow_Previews: PreviewProvider {
    static var previews: some View {
        OptionRow(symbolName: "heart.fill", color: .red, label: "Test") {
            Text("Controls")
        }
    }
}
