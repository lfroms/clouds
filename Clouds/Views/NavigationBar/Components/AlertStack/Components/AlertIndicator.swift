//
//  AlertIndicator.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AlertIndicator: View {
    var alert: WeatherAlert

    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .foregroundColor(alert.color)
                .frame(width: 38, height: 38)

            Image(systemName: alert.type.symbolName)
                .font(Font.callout.bold())
        }
    }
}

extension AlertIndicator: Equatable {}

struct AlertIndicator_Previews: PreviewProvider {
    static var previews: some View {
        AlertIndicator(
            alert: WeatherAlert(
                summary: .empty,
                date: .init(),
                type: .warning,
                status: .active,
                url: URL(string: "https://weather.gc.ca")
            )
        )
    }
}
