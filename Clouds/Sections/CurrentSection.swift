//
//  CurrentSection.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentSection: View {
    var section: AppSection

    var body: some View {
        ZStack(alignment: .bottom) {
            NowSection()
                .opacity(section == .now ? 1 : 0)

            WeekSection()
                .opacity(section == .week ? 1 : 0)

            if section == .radar {
                RadarSection()
            }
        }
        .frame(width: Dimension.System.screenWidth)
    }
}

extension CurrentSection: Equatable {
    static func == (lhs: CurrentSection, rhs: CurrentSection) -> Bool {
        lhs.section == rhs.section
    }
}

struct ActiveTab_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSection(section: .now)
    }
}
