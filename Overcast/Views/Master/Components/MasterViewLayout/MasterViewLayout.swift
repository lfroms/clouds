//
//  MasterViewLayout.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MasterViewLayout<Content: View>: View {
    var handleExists: Bool
    var handleHidden: Bool

    var content: () -> Content

    @inlinable init(handleExists: Bool, handleHidden: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.handleExists = handleExists
        self.handleHidden = handleHidden
        self.content = content
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .topTrailing) {
                WeatherBackground()
                WeatherIllustration()
                    .padding(.top, Dimension.Header.illustrationTopPadding)
            }

            VStack(alignment: .center, spacing: 0) {
                content()

                VStack {
                    if handleExists {
                        DrawerHandle(height: 20)
                            .opacity(handleHidden ? 0 : 1)
                            .animation(.easeInOut)
                            .drawingGroup()
                    }
                }
                .transition(.opacity)
                .animation(.easeInOut)
            }
        }
    }
}

extension MasterViewLayout: Equatable {
    static func == (lhs: MasterViewLayout<Content>, rhs: MasterViewLayout<Content>) -> Bool {
        lhs.handleExists == rhs.handleExists && lhs.handleHidden == rhs.handleHidden
    }
}

struct MasterViewLayout_Previews: PreviewProvider {
    static var previews: some View {
        MasterViewLayout(handleExists: true, handleHidden: false) {
            Text("hello")
        }
    }
}
