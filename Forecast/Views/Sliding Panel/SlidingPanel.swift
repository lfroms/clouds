//
//  SlidingPanel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SlidingPanel<Content: View>: View {
    @Binding var locked: Bool

    var content: () -> Content

    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            MainPagingScrollView(travelDistance: 200) {
                self.content()
                    .frame(height: geometry.size.height)
                    .padding(.bottom, 200)
            }
        }
    }
}

struct SlidingPanel_Previews: PreviewProvider {
    static var previews: some View {
        SlidingPanel(locked: .constant(false)) {
            EmptyView()
        }
    }
}
