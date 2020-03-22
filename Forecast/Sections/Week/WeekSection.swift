//
//  WeekSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeekSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .bottom, spacing: Dimension.Global.padding) {
                DayNightSwitchContainer()
                ConditionLayoutContainer()
            }
            .padding(Dimension.Global.padding)

            VStack(alignment: .center, spacing: Dimension.WeekSection.DayPicker.indicatorSpacing) {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 5, height: Dimension.WeekSection.DayPicker.indicatorSize)
                    .cornerRadius(2.5)

                DayPickerPagingViewContainer()
            }
            .frame(height: Dimension.WeekSection.DayPicker.dayPickerVisualHeight)
            .padding(.bottom, Dimension.WeekSection.DayPicker.bottomPadding)
            .padding(.top, Dimension.WeekSection.DayPicker.topPadding)
        }
    }
}

struct WeekTab_Previews: PreviewProvider {
    static var previews: some View {
        WeekSection()
    }
}
