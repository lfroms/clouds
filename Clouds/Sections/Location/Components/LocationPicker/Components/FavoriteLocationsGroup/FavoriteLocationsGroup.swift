//
//  FavoriteLocationsGroup.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-14.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FavoriteLocationsGroup: View {
    var locations: [StoredLocation]

    var onSelectLocation: (StoredLocation) -> Void
    var onDelete: (StoredLocation) -> Void

    @State private var isEditing: Bool = false

    var body: some View {
        LocationPickerListSection(
            label: "Favourite locations",
            loading: .constant(false),
            auxiliaryButton: auxiliaryButton
        ) {
            if self.locations.isEmpty {
                Text("You haven't added any favourite locations.")
                    .foregroundColor(AppColor.Display.secondary)
                    .font(.caption)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }

            ForEach(Array(self.locations.enumerated()), id: \.element) { _, favorite in
                WeatherLocationItem(
                    style: .favorite,
                    location: favorite,
                    isEditing: self.$isEditing,
                    action: self.onSelectLocation,
                    onDelete: self.handleDelete(_:)
                )
                .equatable()
                .transition(.fadeAndScale)
            }
        }
        .onDisappear {
            self.isEditing = false
        }
    }

    private func handleDelete(_ location: StoredLocation) {
        if locations.isEmpty {
            isEditing = false
        }

        onDelete(location)
    }

    private var auxiliaryButton: (text: String, action: () -> Void)? {
        guard !locations.isEmpty else {
            return nil
        }

        return (
            text: isEditing ? "Done" : "Edit",
            action: {
                self.isEditing.toggle()
            }
        )
    }
}

extension FavoriteLocationsGroup: Equatable {
    static func == (lhs: FavoriteLocationsGroup, rhs: FavoriteLocationsGroup) -> Bool {
        lhs.locations == rhs.locations
    }
}

struct FavoriteLocationsGroup_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteLocationsGroup(
            locations: [],
            onSelectLocation: { _ in },
            onDelete: { _ in }
        )
    }
}
