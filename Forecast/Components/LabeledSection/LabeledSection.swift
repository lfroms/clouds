//
//  LabeledSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LabeledSection<Content: View>: View {
    let label: String
    let headerPadding: Length
    var tinted: Bool?

    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            LabeledSectionHeader(text: label)
                .padding(.horizontal, headerPadding)

            content()
                .background(tinted ?? false ? Color.black.opacity(0.06) : nil)
        }
    }
}

#if DEBUG
struct LabeledSection_Previews: PreviewProvider {
    static var previews: some View {
        LabeledSection(label: "Test Section", headerPadding: 0) {
            EmptyView()
        }
    }
}
#endif
