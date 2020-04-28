//
//  LocationItemDeleteButton.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-20.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationItemDeleteButton: View {
    @Environment(\.sizeCategory) var sizeCategory

    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: SFSymbol.minusCircleFilled)
                .font(Font.system(size: UIFontMetrics.default.scaledValue(for: 20)).weight(.bold))
                .foregroundColor(.red)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

extension LocationItemDeleteButton: Equatable {
    static func == (lhs: LocationItemDeleteButton, rhs: LocationItemDeleteButton) -> Bool {
        lhs.sizeCategory == rhs.sizeCategory
    }
}

struct LocationItemDeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        LocationItemDeleteButton(action: {})
    }
}
