//
//  LabeledGroup.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LabeledGroup<Content: View>: View {
    var label: String
    var content: () -> Content

    @inlinable init(label: String, @ViewBuilder content: @escaping () -> Content) {
        self.label = label
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.white.opacity(0.6))

            Group {
                content()
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(Color.white.opacity(0.07))
            .cornerRadius(14)
        }
    }
}

extension LabeledGroup: Equatable {
    static func == (lhs: LabeledGroup<Content>, rhs: LabeledGroup<Content>) -> Bool {
        lhs.label == rhs.label
    }
}

struct LabeledGroup_Previews: PreviewProvider {
    static var previews: some View {
        LabeledGroup(label: "Section") {
            Text("Content")
        }
    }
}
