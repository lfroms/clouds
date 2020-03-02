//
//  NavigationBar.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var activeSection: AppSection
    let tabs: [AppSection]

    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            ScrollView(.horizontal, showsIndicators: false) {
                TabControl(activeTab: $activeSection, tabs: tabs)
                    .padding(.leading, 20)
            }
            AlertStack()
        }
        .frame(minHeight: 38)
        .padding(.trailing, 20)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(activeSection: .constant(.now), tabs: [])
    }
}
