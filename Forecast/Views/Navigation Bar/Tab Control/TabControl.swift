//
//  TabControl.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabControl: View {
    let tabs: [TabDescriptor]

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            TabView()
            TabView()
            TabView()
        }
    }
}

struct TabControl_Previews: PreviewProvider {
    static var previews: some View {
        TabControl(tabs: [])
    }
}
