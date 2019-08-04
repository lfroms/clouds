//
//  WarningItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-08-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WarningItem: View {
    let color: Color
    let text: String
    let date: Date
    let url: URL? = nil

    var body: some View {
        Button(action: handleAction, label: renderContents)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            .background(color)
    }

    private func renderContents() -> some View {
        HStack(alignment: .center, spacing: 14) {
            Image(systemName: "info.circle.fill")
                .font(Font.system(size: 16).weight(.heavy))

            VStack(alignment: .leading, spacing: 0) {
                Text(text.uppercased())
                    .font(Font.system(size: 13).weight(.heavy))

                Text(date.toString())
                    .font(Font.system(size: 10).weight(.bold))
                    .foregroundColor(Color.primary.opacity(0.75))
            }
        }
        .padding(.horizontal, 36)
        .padding(.vertical, 8)
        .foregroundColor(.primary)
    }

    private func handleAction() {
        print("action")
    }
}

#if DEBUG
struct WarningItem_Previews: PreviewProvider {
    static var previews: some View {
        WarningItem(
            color: .red,
            text: "Warning",
            date: Date()
        )
    }
}
#endif
