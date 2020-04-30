//
//  HourlyForecast.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-03.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct HourlyForecast: View {
    @State private var separatorFrame: CGRect = .zero
    @State private var todayTextFrame: CGRect = .zero

    var items: [HourlyForecastItemData]

    var body: some View {
        VStack(alignment: .leading) {
            if !items.isEmpty {
                ZStack(alignment: .leading) {
                    Text(allHoursAreForTomorrow ? "TOMORROW" : "TODAY")
                        .background(GeometryGetter(rect: self.$todayTextFrame) { oldRect, newRect in
                            oldRect.width != newRect.width
                        })
                        .opacity(todayTextOpacity)
                        .offset(x: todayTextOffset)

                    if self.separatorFrame != .zero && !allHoursAreForTomorrow {
                        Text("TOMORROW")
                            .offset(x: tomorrowTextOffset)
                    }
                }
                .padding(.leading, Dimension.Global.padding)
                .font(Font.caption.weight(.bold))
                .foregroundColor(AppColor.Display.secondary)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: Dimension.HourlyForecast.spacing) {
                    ForEach(items, id: \.self) { item in
                        Group {
                            if item.date.hour == 0 && item != self.items.first {
                                HourlyForecastSeparator()
                                    .background(GeometryGetter(rect: self.$separatorFrame) { oldRect, newRect in
                                        oldRect.minX != newRect.minX
                                    })
                            }

                            HourlyForecastItem(data: item)
                                .equatable()
                        }
                    }
                }
                .modifier(ResetHourlyForecastScroll())
                .padding(.horizontal, Dimension.Global.padding)
                .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
            }
            .frame(height: 140, alignment: .top)
        }
    }

    // MARK: - Today/Tomorrow Label Animation Calculations

    private var spaceAvailableForTodayLabel: CGFloat {
        Dimension.Global.padding + Dimension.HourlyForecast.spacing + todayTextFrame.width
    }

    private var hasReachedTodayLabel: Bool {
        guard separatorFrame != .zero else {
            return false
        }

        return separatorFrame.minX <= spaceAvailableForTodayLabel
    }

    private var todayTextOffset: CGFloat {
        hasReachedTodayLabel ? separatorFrame.minX - spaceAvailableForTodayLabel : .zero
    }

    private var tomorrowTextOffset: CGFloat {
        max(separatorFrame.minX - (Dimension.Global.padding - Dimension.HourlyForecast.spacing), .zero)
    }

    private var todayTextOpacity: Double {
        let animationProgress = max(Double(separatorFrame.minX / spaceAvailableForTodayLabel), .zero)
        return hasReachedTodayLabel ? animationProgress : .one
    }

    private var allHoursAreForTomorrow: Bool {
        items.first?.date.hour == 0
    }
}

extension HourlyForecast: Equatable {
    static func == (lhs: HourlyForecast, rhs: HourlyForecast) -> Bool {
        lhs.items == rhs.items
    }
}

struct HourlyForecast_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecast(items: [])
    }
}
