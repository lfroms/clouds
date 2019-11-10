//
//  CurrentSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentSection: View {
    @Binding var index: Int

    var body: some View {
        Group {
            if index == 1 {
                WeekSection()
            }
            else if index == 2 {
                RadarSection()
            }
            else {
                NowSection()
            }
        }
    }
}

struct ActiveTab_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSection(index: .constant(0))
    }
}
