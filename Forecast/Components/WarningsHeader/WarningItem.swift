//
//  WarningItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-08-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SafariServices
import SwiftDate
import SwiftUI

struct WarningItem: View {
    let color: Color
    let symbolName: String
    let text: String
    let date: DateInRegion
    var action: (() -> Void)?

    var body: some View {
        Button(action: handleAction, label: renderContents)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            .background(color)
    }

    private func renderContents() -> some View {
        HStack(alignment: .center, spacing: 14) {
            Image(systemName: symbolName)
                .font(Font.system(size: 16).weight(.heavy))

            VStack(alignment: .leading, spacing: 0) {
                Text(text.uppercased())
                    .font(Font.system(size: 13).weight(.heavy))

                Text(date.toFormat("MMM d h:mm a", locale: Locales.current).uppercased())
                    .font(Font.system(size: 10).weight(.bold))
                    .foregroundColor(Color.primary.opacity(0.75))
            }
        }
        .padding(.horizontal, 36)
        .padding(.vertical, 8)
        .foregroundColor(.primary)
    }

    private func handleAction() {
        guard let action = action else {
            return
        }

        action()
    }
}

#if DEBUG
struct WarningItem_Previews: PreviewProvider {
    static var previews: some View {
        WarningItem(
            color: .red,
            symbolName: "info.circle.fill",
            text: "Warning",
            date: DateInRegion()
        )
    }
}
#endif
