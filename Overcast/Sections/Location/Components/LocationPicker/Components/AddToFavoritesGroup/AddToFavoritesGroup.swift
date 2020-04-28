//
//  AddToFavoritesGroup.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AddToFavoritesGroup: View {
    var locationName: String
    var action: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Button(action: action) {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: SFSymbol.plusCircleFilled)

                    Text("Add \(locationName) to favourites")
                }
                .font(Font.callout.weight(.semibold))
                .foregroundColor(Color.white.opacity(0.6))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

extension AddToFavoritesGroup: Equatable {
    static func == (lhs: AddToFavoritesGroup, rhs: AddToFavoritesGroup) -> Bool {
        lhs.locationName == rhs.locationName
    }
}

struct AddToFavoritesGroup_Previews: PreviewProvider {
    static var previews: some View {
        AddToFavoritesGroup(
            locationName: "Location",
            action: {}
        )
    }
}
