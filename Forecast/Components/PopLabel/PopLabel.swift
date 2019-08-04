//
//  PopLabel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct PopLabel: View {
    let pop: Int

    var body: some View {
        let foregroundColor: Color = Color.primary.opacity(0.65)

        return HStack(alignment: .bottom, spacing: 4) {
            Image(systemName: "cloud.rain.fill")
                .foregroundColor(foregroundColor)

            Text("\(pop)%")
                .foregroundColor(foregroundColor)
        }
        .font(Font.system(size: 12).weight(.heavy))
    }
}

#if DEBUG
struct PopLabel_Previews: PreviewProvider {
    static var previews: some View {
        PopLabel(pop: 52)
    }
}
#endif
