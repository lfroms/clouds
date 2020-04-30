//
//  AttributionText.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AttributionText: View {
    var attribution: String

    var body: some View {
        Text(attribution)
            .font(.caption)
            .fontWeight(.medium)
            .foregroundColor(Color.white.opacity(0.6))
    }
}

extension AttributionText: Equatable {}

struct AttributionText_Previews: PreviewProvider {
    static var previews: some View {
        AttributionText(attribution: "Some attribution")
    }
}
