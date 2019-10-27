//
//  TabView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        Text("Now")
            .font(Font.callout.bold())
            .padding(.vertical, 6)
            .padding(.horizontal, 16)
            .background(Color.primary.opacity(0.15))
            .cornerRadius(.infinity)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
