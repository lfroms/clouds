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

    var hasDrawerHandle: Bool
    var drawerHandleHidden: Bool

    let iconCode: Int
    let content: () -> Content

    var body: some View {
        Group {
            if useAsContainer {
                content()
            } else {
                StandardContentLayout
            }
        }
        .clipShape(RoundedCornerShape(cornerRadius: 22, style: .continuous, corners: [.bottomLeft, .bottomRight]))
    }

    private var StandardContentLayout: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .topTrailing) {
                BackgroundColor()
                WeatherIllustration()
                    .padding(.top, Dimension.System.topSafeMargin)
            }

            VStack(alignment: .center, spacing: 0) {
                content()

                if !hasDrawerHandle {
                    DrawerHandle(height: 20)
                        .opacity(drawerHandleHidden ? 0 : 1)
                        .animation(.easeInOut)
                }
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(hasDrawerHandle: false, drawerHandleHidden: false, iconCode: 6) {
            Text("Test content")
        }
    }
}
