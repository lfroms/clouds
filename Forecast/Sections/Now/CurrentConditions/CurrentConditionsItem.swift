//
//  CurrentConditionsItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentConditionsItem: View {
    let label: String
    let value: String
    let color: Color

    var prefix: String?

    var body: some View {
        HStack(alignment: .center, spacing: 22) {
            Rectangle()
                .frame(width: 2)
                .foregroundColor(color)
                .cornerRadius(.infinity)

            VStack(alignment: .leading, spacing: 6) {
                Text(label)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                    .bold()

                HStack(alignment: .lastTextBaseline, spacing: 4) {
                    if prefix != nil {
                        Text(prefix!)
                            .font(.system(size: 14))
                            .fontWeight(.heavy)
                    }

                    Text(value)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
            }
        }
        .frame(maxHeight: 50)
    }
}

struct CurrentConditionsItem_Previews: PreviewProvider {
    static var previews: some View {
        CurrentConditionsItem(
            label: "Humidity",
            value: "46%",
            color: .red,
            prefix: "N"
        )
    }
}
