//
//  SearchResultsGroup.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchResultsGroup: View {
    var label: String
    var value: String
    @Binding var loading: Bool
    var results: [RawLocation]
    var favorites: [Bool]

    var onSelectLocation: (RawLocation) -> Void
    var onStarLocation: (RawLocation) -> Void

    var body: some View {
        LocationPickerListSection(label: label, value: value, loading: $loading) {
            ForEach(Array(self.results.enumerated()), id: \.element) { index, result in
                SearchResultLocationItem(
                    location: result,
                    favorite: self.favorites[safe: index] ?? false,
                    action: self.onSelectLocation,
                    onStar: self.onStarLocation
                )
                .equatable()
                .transition(.fadeAndScale(index: index))
            }
        }
    }
}

extension SearchResultsGroup: Equatable {
    static func == (lhs: SearchResultsGroup, rhs: SearchResultsGroup) -> Bool {
        lhs.label == rhs.label
            && lhs.value == rhs.value
            && lhs.loading == rhs.loading
            && lhs.results == rhs.results
            && lhs.favorites == rhs.favorites
    }
}

struct SearchResultsGroup_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsGroup(
            label: "Test",
            value: "Value",
            loading: .constant(false),
            results: [],
            favorites: [],
            onSelectLocation: { _ in },
            onStarLocation: { _ in }
        )
    }
}
