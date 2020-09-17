//
//  SettingsChangelog.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-05-01.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SettingsChangelog: View {
    @State private var loading: Bool = false

    private static let request = URLRequest(url: URL(string: "https://cloudsapp.romsicki.com/changelog")!, cachePolicy: .reloadIgnoringLocalCacheData)

    var body: some View {
        WebView(request: Self.request, loading: $loading)
            .equatable()
            .ignoresSafeArea(.container)
            .navigationBarTitle("What's New")
            .navigationBarItems(trailing: loading ? AppActivityIndicator(style: .dark) : nil)
    }
}

struct SettingsChangelog_Previews: PreviewProvider {
    static var previews: some View {
        SettingsChangelog()
    }
}
