//
//  TimestampView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct TimestampView: View {
    let date: Date

    var body: some View {
        Text(parsedDate())
            .font(.system(size: 13))
            .fontWeight(.heavy)
            .opacity(0.45)
    }

    private func parsedDate() -> String {
        return date
            .convertTo(region: .current)
            .toFormat("MMM d 'at' h:mm a", locale: Locales.current)
    }
}

#if DEBUG
struct TimestampView_Previews: PreviewProvider {
    static var previews: some View {
        TimestampView(date: Date())
    }
}
#endif
