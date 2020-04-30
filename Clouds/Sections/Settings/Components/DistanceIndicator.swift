//
//  DistanceIndicator.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DistanceIndicator: View {
    var kilometers: Int

    var body: some View {
        VStack(alignment: .center, spacing: 5.0) {
            Image(systemName: "mappin.and.ellipse")
            Text("\(kilometers) km")
        }
        .font(Font.caption.weight(.semibold))
    }
}

struct DistanceIndicator_Previews: PreviewProvider {
    static var previews: some View {
        DistanceIndicator(kilometers: 5)
    }
}
