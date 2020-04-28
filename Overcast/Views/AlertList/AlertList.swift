//
//  AlertList.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-26.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AlertList: View {
    var alerts: [WeatherAlert]
    var didSelect: (WeatherAlert) -> Void
    var didClose: () -> Void

    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            AlertListCloseButton(action: didClose)
                .equatable()

            VStack(alignment: .leading, spacing: 12) {
                ForEach(alerts, id: \.self) { alert in
                    AlertItem(data: alert, action: { self.didSelect(alert) })
                }
            }
        }
    }
}

extension AlertList: Equatable {
    static func ==(lhs: AlertList, rhs: AlertList) -> Bool {
        lhs.alerts == rhs.alerts
    }
}

struct AlertList_Previews: PreviewProvider {
    static var previews: some View {
        AlertList(alerts: [], didSelect: { _ in }, didClose: {})
    }
}
