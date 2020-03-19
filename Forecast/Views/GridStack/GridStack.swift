//
//  GridStack.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    var columns: Int
    var numberOfItems: Int
    var spacingVertical: CGFloat?
    var spacingHorizontal: CGFloat?
    var alignment: HorizontalAlignment
    var content: (Int) -> Content

    init(
        columns: Int,
        numberOfItems: Int,
        spacingVertical: CGFloat? = nil,
        spacingHorizontal: CGFloat? = nil,
        alignment: HorizontalAlignment = .leading,
        @ViewBuilder content: @escaping (Int) -> Content
    ) {
        self.columns = columns
        self.numberOfItems = numberOfItems
        self.spacingVertical = spacingVertical
        self.spacingHorizontal = spacingHorizontal
        self.alignment = alignment
        self.content = content
    }

    var body: some View {
        VStack(alignment: alignment, spacing: spacingVertical) {
            ForEach(0 ..< (self.numberOfItems / self.columns), id: \.self) { row in
                HStack(spacing: self.spacingHorizontal) {
                    ForEach(0 ... (self.columns - 1), id: \.self) { column in
                        self.content((row * self.columns) + column)
                    }
                }
            }

            if (self.numberOfItems % self.columns) != 0 {
                HStack(spacing: self.spacingHorizontal) {
                    ForEach(0 ..< (self.numberOfItems % self.columns)) { column in
                        self.content(((self.numberOfItems / self.columns) * self.columns) + column)
                    }
                }
            }
        }
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(columns: 2, numberOfItems: 2) { _ in
            EmptyView()
        }
    }
}
