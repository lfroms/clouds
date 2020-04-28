//
//  DayNightSwitchToggle.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayNightSwitchToggle: View {
    var focused: Bool
    var focusable: Bool
    var size: CGFloat

    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(width: size, height: height)
            .cornerRadius(size / 2)
    }

    private var color: Color {
        focused ? Color.white.opacity(0.7) : .white
    }

    private var height: CGFloat {
        guard focusable else {
            return size
        }

        return focused ? size + 8 : size
    }
}

extension DayNightSwitchToggle: Equatable {}

struct DayNightSwitchToggle_Previews: PreviewProvider {
    static var previews: some View {
        DayNightSwitchToggle(focused: false, focusable: true, size: 40)
    }
}
