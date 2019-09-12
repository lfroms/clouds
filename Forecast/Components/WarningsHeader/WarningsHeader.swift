//
//  WarningsHeader.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-08-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftDate
import SwiftUI

struct WarningsHeader: View {
    typealias WarningEvent = WeatherQuery.Data.Weather.Warning.Event
    let warnings: [WarningEvent]?
    var url: String?

    @State var showWarningDetails = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(warnings ?? [], id: \.time) { warning in
                WarningItem(
                    color: warning.priority.color,
                    symbolName: warning.priority.iconName,
                    text: warning.summary,
                    date: self.getDate(timeStamp: warning.time),
                    action: self.toggleSafariViewSheet
                )
            }
        }
        .padding(.top, getTopSafeMargin())
        .padding([.leading, .trailing, .bottom], 18)
        .sheet(isPresented: $showWarningDetails, content: renderSheet)
    }

    private func getDate(timeStamp: Int) -> DateInRegion {
        return Date(seconds: Double(timeStamp), region: .UTC).convertTo(region: .current)
    }

    private func getTopSafeMargin() -> CGFloat {
        guard let window = UIApplication.shared.windows.first else {
            return 0
        }

        return window.safeAreaInsets.top
    }

    private func renderSheet() -> some View {
        let urlObj = URL(string: url ?? "http://weather.gc.ca")
        return SafariView(url: urlObj).edgesIgnoringSafeArea(.all)
    }

    private func toggleSafariViewSheet() {
        self.showWarningDetails.toggle()
    }
}

#if DEBUG
struct WarningsHeader_Previews: PreviewProvider {
    static var previews: some View {
        WarningsHeader(warnings: [])
    }
}
#endif