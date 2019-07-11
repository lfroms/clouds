//
//  RegionalNormalsSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

private let TEST_RN = [
    IconDetailDescriptor(symbolName: "arrow.up", text: "25°"),
    IconDetailDescriptor(symbolName: "arrow.down", text: "16°"),
]

struct RegionalNormalsSection: View {
    var body: some View {
        LabeledSection(label: "Regional Normals", headerPadding: 36, tinted: false) {
            IconDetailCollection(items: TEST_RN)
                .padding(.horizontal, 36)
        }
    }
}

#if DEBUG
struct RegionalNormalsSection_Previews: PreviewProvider {
    static var previews: some View {
        RegionalNormalsSection()
    }
}
#endif
