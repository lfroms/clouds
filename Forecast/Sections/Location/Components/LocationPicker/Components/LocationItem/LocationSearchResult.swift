//
//  LocationSearchResult.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationSearchResult: View {
    var location: RawLocation
    var favorite: Bool

    var action: (RawLocation) -> Void
    var onStar: ((RawLocation) -> Void)?

    internal enum Style: String {
        case current
        case favorite
        case search

        var symbolName: String {
            switch self {
            case .current:
                return SFSymbol.locationFilled
            case .favorite:
                return SFSymbol.starFilled
            case .search:
                return SFSymbol.mapFilled
            }
        }
    }

    var body: some View {
        Button(action: { self.action(self.location) }) {
            HStack(alignment: .center, spacing: Dimension.Spacing.barItems) {
                LocationItemIcon(name: SFSymbol.mapFilled)

                LocationItemLabels(title: self.location.name, subtitle: self.location.regionName)
                Spacer()

                LocationItemStarButton(isHighlighted: self.favorite) {
                    self.onStar?(self.location)
                }
            }
            .padding(.horizontal, 20)
            .frame(height: Dimension.LocationPicker.itemHeight)
            .background(Color(white: 0.09))
            .cornerRadius(14)
            .animation(AnimationPreset.Touch.shrink)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

extension LocationSearchResult: Equatable {
    static func == (lhs: LocationSearchResult, rhs: LocationSearchResult) -> Bool {
        lhs.location == rhs.location && lhs.favorite == rhs.favorite
    }
}

struct LocationSearchResult_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResult(
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
