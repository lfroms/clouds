//
//  SettingsSheetCloseButtonRow.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SettingsSheetCloseButtonRow: View {
    @EnvironmentObject private var settingsSheetState: SettingsSheetState

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.settingsSheetState.presented.toggle()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(Color.white.opacity(0.6))
                    .font(Font.system(size: 12).weight(.bold))
                    .frame(width: 30, height: 30, alignment: .center)
                    .background(Color.white.opacity(0.12))
                    .cornerRadius(.infinity)
            }
        }
    }
}

struct SettingsSheetCloseButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSheetCloseButtonRow()
    }
}
