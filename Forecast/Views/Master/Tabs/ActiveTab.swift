//
//  ActiveTab.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ActiveTab: View {
    @Binding var index: Int

    var body: some View {
        Group {
            if index == 1 {
                Text("hi")
            }
            else if index == 2 {
                Text("3")
            }
            else {
                NowTab()
            }
        }
    }
}

struct ActiveTab_Previews: PreviewProvider {
    static var previews: some View {
        ActiveTab(index: .constant(0))
    }
}
