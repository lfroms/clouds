//
//  IconDetailView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct IconDetailView: View {
    let symbolName: String
    let text: String

    var body: some View {
        let iconColor: Color = Color.primary.opacity(0.72)

        return HStack(alignment: .firstTextBaseline, spacing: 6) {
            Image(systemName: symbolName)
                .font(Font.system(size: 14).weight(.heavy))
                .foregroundColor(iconColor)

            Text(text)
                .font(Font.system(size: 19).weight(.heavy))
        }
    }
}

#if DEBUG
struct IconDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IconDetailView(symbolName: "arrow.up", text: "15mm")
    }
}
#endif
