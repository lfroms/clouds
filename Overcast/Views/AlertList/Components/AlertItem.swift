//
//  AlertItem.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-26.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AlertItem: View {
    var data: WeatherAlert
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 1) {
                    Text(data.summary)
                        .font(.callout)
                        .fontWeight(.heavy)

                    Text(data.date.toFormat("MMMM d 'at' h:mm a"))
                        .font(.caption)
                        .fontWeight(.semibold)
                }

                Spacer(minLength: Dimension.Global.padding)

                Image(systemName: SFSymbol.chevronRight)
                    .font(Font.callout.weight(.bold))
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 58, maxHeight: 58, alignment: .center)
            .padding(.horizontal, Dimension.Global.padding)
            .background(RoundedRectangle(cornerRadius: 14).foregroundColor(data.color))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

extension AlertItem: Equatable {
    static func == (lhs: AlertItem, rhs: AlertItem) -> Bool {
        lhs.data == rhs.data
    }
}

struct AlertItem_Previews: PreviewProvider {
    static var previews: some View {
        AlertItem(
            data: WeatherAlert(
                summary: "Test",
                date: .init(),
                type: .watch,
                status: .active
            ),
            action: {}
        )
    }
}
