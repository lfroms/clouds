//
//  ShrinkOnWeekSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ShrinkOnWeekSection: ViewModifier {
    var shrink: Bool

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .frame(maxHeight: self.shrink ? geometry.size.height - Dimension.WeekSection.DayPicker.dayPickerTotalHeight : nil, alignment: .top)
                .clipShape(RoundedCornerShape(cornerRadius: 22, style: .continuous, corners: [.bottomLeft, .bottomRight]))
                .animation(.spring())

            Spacer(minLength: 0)
        }
        .background(Color.black)
    }
}
