//
//  TabView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabView: View {
    let text: String
    let action: () -> Void
    var isActive: Bool

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(Font.callout.bold())
                .foregroundColor(.primary)
                .opacity(opacity)
                .animation(.easeInOut(duration: 0.2))
        }
    }

    private var opacity: Double {
        isActive ? 1 : 0.6
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(text: "Tab", action: {}, isActive: false)
    }
}