//
//  NavigationBar.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct NavigationBar: View {
    let tabs: [TabDescriptor]

    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            TabControl(tabs: tabs)
            Spacer()
            AlertStack()
        }
        .frame(minHeight: 38)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(tabs: [])
    }
}
