//
//  TemperatureView.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TemperatureView: View {
    @Environment(\.sizeCategory) var sizeCategory

    var value: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Text(value)
                .fontWeight(.heavy)
            Text("°")
                .fontWeight(.medium)
        }
        .font(.system(size: UIFontMetrics.default.scaledValue(for: 72)))
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
        .lineLimit(1)
    }
}

extension TemperatureView: Equatable {
    static func == (lhs: TemperatureView, rhs: TemperatureView) -> Bool {
        lhs.value == rhs.value && lhs.sizeCategory == rhs.sizeCategory
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(value: "10")
    }
}
