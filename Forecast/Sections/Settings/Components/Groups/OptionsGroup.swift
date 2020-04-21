//
//  OptionsGroup.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-04-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OptionsGroup: View {
    @EnvironmentObject private var settingsSheetState: SettingsSheetState

    var body: some View {
        LabeledGroup(label: "Settings") {
            VStack(alignment: .leading, spacing: 14) {
                OptionRow(symbolName: "thermometer", color: .blue, label: "Units") {
                    Picker("Temperature Units", selection: self.$settingsSheetState.isImperial) {
                        Text("Imperial").tag(true)
                        Text("Metric").tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Divider()

                OptionRow(symbolName: "viewfinder", color: .red, label: "Radar Opacity") {
                    Slider(value: self.$settingsSheetState.radarOpacity, in: 0.5...1.0, step: 0.12)
                }

                Divider()

                NavigationLink(destination: SettingsRadarSourceContainer().environmentObject(self.settingsSheetState)) {
                    OptionRow(symbolName: "globe", color: .green, label: "Radar Source") {
                        Image(systemName: "chevron.right")
                    }
                }
            }
        }
    }
}

struct OptionsGroup_Previews: PreviewProvider {
    static var previews: some View {
        OptionsGroup()
    }
}
