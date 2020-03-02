//
//  CurrentSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentSection: View {
    @Binding var section: AppSection

    @ViewBuilder
    var body: some View {
        if section == .week {
            WeekSection()
        }
        else if section == .radar {
            RadarSection()
        }
        else {
            NowSection()
        }
    }
}

struct ActiveTab_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSection(section: .constant(.now))
    }
}
