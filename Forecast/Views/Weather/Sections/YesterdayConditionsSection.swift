//
//  YesterdayConditionsSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

private let TEST_YESTERDAY = [
    IconDetailDescriptor(symbolName: "arrow.up", text: "20°"),
    IconDetailDescriptor(symbolName: "arrow.down", text: "15°"),
    IconDetailDescriptor(symbolName: "cloud.rain.fill", text: "15mm"),
]

struct YesterdayConditionsSection: View {
    var body: some View {
        LabeledSection(label: "Yesterday", headerPadding: 36, tinted: false) {
            IconDetailCollection(items: TEST_YESTERDAY)
                .padding(.horizontal, 36)
        }
    }
}

#if DEBUG
struct YesterdayConditionsSection_Previews: PreviewProvider {
    static var previews: some View {
        YesterdayConditionsSection()
    }
}
#endif
