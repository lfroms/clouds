//
//  MasterView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MasterView<Content: View>: View {
    var useAsContainer: Bool = false

    let iconCode: Int
    let content: () -> Content

    var body: some View {
        Group {
            if useAsContainer {
                content()
            } else {
                StandardContentLayout()
            }
        }
        .cornerRadius(22)
    }

    private func StandardContentLayout() -> some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .topTrailing) {
                BackgroundColor(iconCode: iconCode)
                WeatherIllustration(iconCode: iconCode)
            }

            VStack(alignment: .center, spacing: 0) {
                content()
                DrawerHandle(height: 20)
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(iconCode: 6) {
            Text("Test content")
        }
    }
}
