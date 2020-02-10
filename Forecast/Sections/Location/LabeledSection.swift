//
//  LabeledSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LabeledSection<Content>: View where Content: View {
    let label: String
    let loading: Bool?
    let content: () -> Content

    init(label: String, loading: Bool? = false, @ViewBuilder content: @escaping () -> Content) {
        self.label = label
        self.loading = loading
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center) {
                Text(label)
                    .font(.callout)
                    .fontWeight(.semibold)

                Spacer()

                if loading ?? false {
                    LineActivityIndicator()
                }
            }

            content()
        }
    }
}

struct LabeledSection_Previews: PreviewProvider {
    static var previews: some View {
        LabeledSection(label: "Current location") {
            EmptyView()
        }
    }
}
