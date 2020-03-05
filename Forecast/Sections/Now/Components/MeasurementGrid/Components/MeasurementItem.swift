//
//  MeasurementItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MeasurementItem: View {
    var descriptor: MeasurementDescriptor

    var body: some View {
        HStack(alignment: .center, spacing: 22) {
            Rectangle()
                .frame(width: 2)
                .foregroundColor(descriptor.color)
                .cornerRadius(.infinity)

            VStack(alignment: .leading, spacing: 6) {
                Text(descriptor.label)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                    .bold()

                HStack(alignment: .lastTextBaseline, spacing: 4) {
                    if descriptor.prefix != nil {
                        Text(descriptor.prefix!)
                            .font(.system(size: 14))
                            .fontWeight(.heavy)
                    }

                    Text(descriptor.value)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
            }
        }
        .frame(maxHeight: 50)
    }
}

extension MeasurementItem: Equatable {}

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
