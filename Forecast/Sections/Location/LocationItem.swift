//
//  LocationItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationItem: View {
    let icon: String
    let title: String
    var subtitle: String?

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(Font.callout.weight(.bold))
            Text(title)
                .font(Font.callout.weight(.bold))
            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(height: 57)
        .background(Color.blue)
        .cornerRadius(14)
    }
}

struct LocationItem_Previews: PreviewProvider {
    static var previews: some View {
        LocationItem(icon: "location.fill", title: "Ottawa")
    }
}
