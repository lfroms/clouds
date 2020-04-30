//
//  SettingsSection.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-02-29.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SettingsSection: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 24) {
                    AppMetadata()
                        .equatable()
                        .frame(minWidth: 0, maxWidth: .infinity)

                    DataSourceGroup()

                    Divider()

                    OptionsGroup()
                }
                .padding(20)
            }
            .navigationBarItems(trailing: SettingsSheetCloseButtonRow())
            .navigationBarTitle("", displayMode: .inline)
        }
        .foregroundColor(.white)
        .background(Color(red: 0.12, green: 0.12, blue: 0.12).edgesIgnoringSafeArea(.all))
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSection()
    }
}

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String
    }
}
