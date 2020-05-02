//
//  SettingsPrivacy.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-05-01.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SettingsPrivacy: View {
    @State private var loading: Bool = false

    private static let request = URLRequest(url: URL(string: "https://cloudsapp.romsicki.com/app/privacy")!, cachePolicy: .reloadIgnoringLocalCacheData)

    var body: some View {
        WebView(request: Self.request, loading: $loading)
            .equatable()
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("Privacy Policy")
            .navigationBarItems(trailing: loading ? AppActivityIndicator(style: .dark) : nil)
    }
}

struct SettingsPrivacy_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPrivacy()
    }
}
