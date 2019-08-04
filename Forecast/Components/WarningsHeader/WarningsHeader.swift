//
//  WarningsHeader.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-08-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WarningsHeader: View {
    typealias WarningEvent = WeatherQuery.Data.Weather.Warning.Event
    let warnings: [WarningEvent]?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            WarningItem(color: .red, text: "Special Weather Statement", date: Date())
            WarningItem(color: .red, text: "Special Weather Statement", date: Date())
        }
        .padding(.top, getTopSafeMargin())
        .background(Color.red)
    }

    private func getTopSafeMargin() -> CGFloat {
        guard let window = UIApplication.shared.windows.first else {
            return 0
        }

        return window.safeAreaInsets.top
    }
}

#if DEBUG
struct WarningsHeader_Previews: PreviewProvider {
    static var previews: some View {
        WarningsHeader(warnings: [])
    }
}
#endif
