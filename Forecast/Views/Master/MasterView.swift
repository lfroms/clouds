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
        .clipShape(RoundedCornerShape(cornerRadius: 22, style: .continuous))
    }

    private var StandardContentLayout: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .topTrailing) {
                BackgroundColor(iconCode: iconCode)
                WeatherIllustration(iconCode: iconCode)
                    .padding(.top, topSafeAreaInset)
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

    private var topSafeAreaInset: CGFloat {
        let window = UIApplication.shared.windows.first
        return window?.safeAreaInsets.top ?? 0
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(hasDrawerHandle: false, drawerHandleHidden: false, iconCode: 6) {
            Text("Test content")
        }
    }
}
