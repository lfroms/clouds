//
//  LocationItemIcon.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationItemIcon: View {
    let name: String

    var body: some View {
        Image(systemName: name)
            .font(Font.callout.weight(.bold))
    }
}

struct LocationItemIcon_Previews: PreviewProvider {
    static var previews: some View {
        LocationItemIcon(name: "star.fill")
    }
}
