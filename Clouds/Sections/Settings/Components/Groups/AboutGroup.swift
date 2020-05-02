//
//  AboutGroup.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-05-01.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AboutGroup: View {
    var body: some View {
        LabeledGroup(label: "About") {
            VStack(alignment: .leading, spacing: 14) {
                NavigationLink(destination: SettingsChangelog()) {
                    OptionRow(symbolName: "text.bubble.fill", color: .purple, label: "What's New?") {
                        Image(systemName: "chevron.right")
                    }
                }

                Divider()

                NavigationLink(destination: SettingsPrivacy()) {
                    OptionRow(symbolName: "hand.raised.fill", color: .blue, label: "Privacy Policy") {
                        Image(systemName: "chevron.right")
                    }
                }
            }
        }
    }
}

struct AboutGroup_Previews: PreviewProvider {
    static var previews: some View {
        AboutGroup()
    }
}
