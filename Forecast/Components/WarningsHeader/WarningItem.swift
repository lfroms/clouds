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

    @State var pushed: Bool = false

    var body: some View {
        return Button(action: handleAction, label: renderContents)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            .background(color)
            .cornerRadius(8)
            .onLongPressGesture(minimumDuration: 0, maximumDistance: 0, pressing: { pressing in
                self.pushed = pressing
            }, perform: {})
            .scaleEffect(self.pushed ? 0.97 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.55, blendDuration: 0))
            .shadow(color: Color.black.opacity(0.4), radius: 33)
    }

    private func renderContents() -> some View {
        HStack(alignment: .center, spacing: 14) {
            Image(systemName: symbolName)
                .font(Font.system(size: 16).weight(.heavy))

            VStack(alignment: .leading, spacing: 0) {
                Text(text)
                    .font(Font.system(size: 15).weight(.heavy))

                Text(date.toFormat("MMMM d h:mm a", locale: Locales.current))
                    .font(Font.system(size: 10).weight(.heavy))
                    .foregroundColor(Color.primary.opacity(0.85))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
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
