//
//  CurrentSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentSection: View, Equatable {
    @Binding var section: AppSection

    var body: some View {
        ZStack(alignment: .bottom) {
            WeekSection()
                .opacity(section == .week ? 1 : 0)

            NowSection()
                .opacity(section == .now ? 1 : 0)

//            RadarSection()
//                .opacity(section == .radar ? 1 : 0)
        }
        .frame(width: Dimension.System.screenWidth)
    }

    static func == (lhs: CurrentSection, rhs: CurrentSection) -> Bool {
        lhs.section == rhs.section
    }
}

struct ActiveTab_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSection(section: .constant(.now))
    }
}
