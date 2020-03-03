//
//  MasterView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MasterView<Content: View>: View, Equatable {
    var useAsContainer: Bool
    var hasDrawerHandle: Bool
    var drawerHandleHidden: Bool

    var content: Content

    @inlinable init(useAsContainer: Bool = false, hasDrawerHandle: Bool, drawerHandleHidden: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.useAsContainer = useAsContainer
        self.hasDrawerHandle = hasDrawerHandle
        self.drawerHandleHidden = drawerHandleHidden
        self.content = content()
    }

    var body: some View {
        Group {
            if useAsContainer {
                content
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
                    .padding(.top, Dimension.Header.illustrationTopPadding)
            }

            VStack(alignment: .center, spacing: 0) {
                content

                if !hasDrawerHandle {
                    DrawerHandle(height: 20)
                        .opacity(drawerHandleHidden ? 0 : 1)
                        .animation(.easeInOut)
                }
            }
        }
    }

    // MARK: - Equatable

    static func == (lhs: MasterView<Content>, rhs: MasterView<Content>) -> Bool {
        lhs.useAsContainer == rhs.useAsContainer && lhs.hasDrawerHandle == rhs.hasDrawerHandle
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(hasDrawerHandle: false, drawerHandleHidden: false) {
            Text("Test content")
        }
    }
}
