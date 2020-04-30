//
//  DayNightSwitch.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DayNightSwitch: View {
    @Binding var isOn: Bool
    var hasDay: Bool
    var hasNight: Bool

    private let size: CGFloat = 42
    private let padding: CGFloat = 3

    @State private var pressed: Bool = false

    var body: some View {
        VStack {
            Spacer()

            VStack(alignment: .center, spacing: 0) {
                if hasDay {
                    Image(systemName: SFSymbol.sunMaxFilled)
                        .frame(width: size, height: size)
                        .colorMultiply(isOnWithDefault ? .white : .black)
                }

                if hasNight {
                    Image(systemName: SFSymbol.moonFilled)
                        .frame(width: size, height: size)
                        .colorMultiply(isOnWithDefault ? .black : .white)
                }
            }
            .font(Font.body.weight(.bold))
            .background(toggleControl, alignment: isOn ? .bottom : .top)
            .padding(padding)
            .background(Color.white.opacity(0.14))
            .cornerRadius(width / 2)
            .animation(.spring(response: 0.4, dampingFraction: 0.7), value: [isOn, pressed, hasDay, hasNight])

            .onTapGesture {
                if self.hasDay, self.hasNight {
                    UISelectionFeedbackGenerator().selectionChanged()
                    self.isOn.toggle()
                }
            }
            .onLongPressGesture(minimumDuration: 0, maximumDistance: 50, pressing: {
                self.pressed = $0
            }, perform: {})
        }
    }

    private var toggleControl: some View {
        DayNightSwitchToggle(focused: pressed, focusable: ableToToggle, size: size)
            .equatable()
    }

    private var ableToToggle: Bool {
        hasDay && hasNight
    }

    private var width: CGFloat {
        (2 * padding) + size
    }

    private var isOnWithDefault: Bool {
        if hasDay, !hasNight {
            return false
        }

        if !hasDay, hasNight {
            return true
        }

        return isOn
    }
}

extension DayNightSwitch: Equatable {
    static func == (lhs: DayNightSwitch, rhs: DayNightSwitch) -> Bool {
        lhs.isOn == rhs.isOn && lhs.hasDay == rhs.hasDay && lhs.hasNight == rhs.hasNight
    }
}

struct DayNightSwitch_Previews: PreviewProvider {
    static var previews: some View {
        DayNightSwitch(isOn: .constant(false), hasDay: true, hasNight: true)
    }
}
