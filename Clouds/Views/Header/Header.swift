//
//  Header.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack(alignment: .top) {
            HeaderGradientContainer()
                .ignoresSafeArea(.container)

            VStack(alignment: .leading, spacing: Dimension.Global.padding) {
                OmniBarContainer()
                HeaderAccessoriesContainer()
            }
            .padding(Dimension.Global.padding)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
