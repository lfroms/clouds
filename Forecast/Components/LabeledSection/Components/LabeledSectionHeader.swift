//
//  LabeledSectionHeader.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LabeledSectionHeader: View {
    let text: String

    var body: some View {
        Text(text.uppercased())
            .font(.system(size: 13))
            .fontWeight(.heavy)
            .color(Color.primary.opacity(0.5))
    }
}

#if DEBUG
struct LabeledSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        LabeledSectionHeader(text: "Hourly")
    }
}
#endif
