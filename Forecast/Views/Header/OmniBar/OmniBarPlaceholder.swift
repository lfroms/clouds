//
//  OmniBarPlaceholder.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBarPlaceholder: View {
    var body: some View {
        Text("Tap to search")
            .fontWeight(.semibold)
            .opacity(0.3)
    }
}

struct OmniBarPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        OmniBarPlaceholder()
    }
}
