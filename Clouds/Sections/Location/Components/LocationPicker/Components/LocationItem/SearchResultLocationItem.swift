//
//  SearchResultLocationItem.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchResultLocationItem: View {
    var location: RawLocation
    var favorite: Bool

    var action: (RawLocation) -> Void
    var onStar: ((RawLocation) -> Void)?

    var body: some View {
        LocationItem(action: { self.action(self.location) }) {
            LocationItemIcon(name: SFSymbol.mapFilled)
            LocationItemLabels(title: self.location.name, subtitle: self.location.regionName)

            Spacer()

            LocationItemStarButton(isHighlighted: self.favorite) {
                self.onStar?(self.location)
            }
        }
    }
}

extension SearchResultLocationItem: Equatable {
    static func == (lhs: SearchResultLocationItem, rhs: SearchResultLocationItem) -> Bool {
        lhs.location == rhs.location && lhs.favorite == rhs.favorite
    }
}

struct LocationSearchResult_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultLocationItem(
            location: RawLocation(
                name: "Ottawa",
                regionName: "ON, Canada"
            ),
            favorite: false,
            action: { _ in },
            onStar: { _ in }
        )
    }
}
