//
//  MeasurementItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MeasurementItem: View {
    @Environment(\.sizeCategory) var sizeCategory

    var descriptor: MeasurementDescriptor

    var body: some View {
        HStack(alignment: .center, spacing: 22) {
            Rectangle()
                .frame(width: 2)
                .foregroundColor(descriptor.color)
                .cornerRadius(.infinity)

            VStack(alignment: .leading, spacing: 6) {
                Text(descriptor.label)
                    .font(.caption)
                    .foregroundColor(AppColor.Display.secondary)
                    .bold()

                HStack(alignment: .lastTextBaseline, spacing: 4) {
                    if descriptor.prefix != nil {
                        Text(descriptor.prefix!)
                            .font(.footnote)
                            .fontWeight(.heavy)
                    }

                    Text(descriptor.value)
                        .font(.system(size: UIFontMetrics.default.scaledValue(for: 20)))
                        .fontWeight(.bold)
                }
            }
        }
        .frame(maxHeight: Dimension.MeasurementGrid.itemHeight)
        .accessibilityElement(children: .combine)
    }
}

extension MeasurementItem: Equatable {
    static func == (lhs: MeasurementItem, rhs: MeasurementItem) -> Bool {
        lhs.sizeCategory == rhs.sizeCategory && lhs.descriptor == rhs.descriptor
    }
}

struct CurrentConditionsItem_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementItem(
            descriptor: MeasurementDescriptor(
                label: "Humidity",
                value: "46%",
                color: .red,
                prefix: "N"
            )
        )
    }
}
