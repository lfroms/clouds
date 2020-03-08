//
//  NavigationBar.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            ScrollView(.horizontal, showsIndicators: false) {
                TabControlContainer()
                    .padding(.leading, 20)
            }

            AlertStackContainer()
        }
        .frame(minHeight: 38)
        .padding(.trailing, 20)
    }
}

extension NavigationBar: Equatable {}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
