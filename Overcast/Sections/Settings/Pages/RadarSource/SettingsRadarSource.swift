//
//  SettingsRadarSource.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-21.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SettingsRadarSource: View {
    @Binding var selectedSource: RadarProvider

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: Dimension.Global.padding) {
                LabeledGroup {
                    VStack(alignment: .leading, spacing: 14) {
                        Button(action: { self.selectedSource = .environmentCanada }) {
                            OptionRow(symbolName: "map.fill", color: .red, label: "ECCC (Canada & USA)") {
                                if self.selectedSource == .environmentCanada {
                                    Image(systemName: "checkmark.circle.fill")
                                }
                            }
                        }

                        Divider()

                        Button(action: { self.selectedSource = .rainviewer }) {
                            OptionRow(symbolName: "globe", color: .blue, label: "Rainviewer (Global)") {
                                if self.selectedSource == .rainviewer {
                                    Image(systemName: "checkmark.circle.fill")
                                }
                            }
                        }
                    }
                }

                Text("ECCC: Environment and Climate Change Canada")
                    .font(.caption)
                    .foregroundColor(AppColor.Display.secondary)
            }
            .padding(Dimension.Global.padding)
        }
        .navigationBarTitle("Radar Data Source")
    }
}

struct SettingsRadarSource_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRadarSource(selectedSource: .constant(.environmentCanada))
    }
}
