//
//  DayPickerPagingViewContainer.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayPickerPagingViewContainer: Container {
    @EnvironmentObject private var weekSectionState: WeekSectionState

    var body: some View {
        DayPickerPagingView(
            pageWidth: Dimension.WeekSection.DayPicker.bubbleSize,
            spacing: Dimension.WeekSection.DayPicker.spacing,
            currentPage: $weekSectionState.dayIndex
        ) {
            DayPickerContainer()
        }
    }
}

struct DayPickerPagingViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        DayPickerPagingViewContainer()
    }
}
