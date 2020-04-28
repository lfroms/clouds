//
//  AlertStack.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AlertStack: View {
    var alerts: [WeatherAlert]
    var action: () -> Void

    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            ForEach(alerts, id: \.self) { alert in
                Button(action: self.action) {
                    AlertIndicator(alert: alert)
                        .equatable()
                }
            }
        }
    }
}

extension AlertStack: Equatable {
    static func == (lhs: AlertStack, rhs: AlertStack) -> Bool {
        lhs.alerts == rhs.alerts
    }
}

struct AlertStack_Previews: PreviewProvider {
    static var previews: some View {
        AlertStack(alerts: [], action: {})
    }
}
