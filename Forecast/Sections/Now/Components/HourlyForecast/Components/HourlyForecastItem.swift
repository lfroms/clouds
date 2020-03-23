//
//  HourlyForecastItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct HourlyForecastItem: View {
    @Environment(\.sizeCategory) var sizeCategory

    private let workItemService = WorkItemService()
    @State var expanded: Bool = false

    var data: HourlyForecastItemData

    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                FixedSizeText(formattedHour)
                FixedSizeText(amPm)
                    .foregroundColor(AppColor.Display.primary.opacity(0.65))
            }
            .font(Font.system(size: UIFontMetrics.default.scaledValue(for: 14)).weight(.semibold))

            Spacer()

            if expanded {
                HourlyForecastDetail(iconName: SFSymbol.wind, label: getWindSpeedText())
                Spacer()
                HourlyForecastDetail(iconName: SFSymbol.umbrellaFilled, label: data.pop)

            } else {
                Image(systemName: self.data.symbolName)
                    .font(Font.system(size: UIFontMetrics.default.scaledValue(for: 23)))

                Spacer()

                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    FixedSizeText("\(data.temperature)")
                    FixedSizeText("°")
                        .foregroundColor(AppColor.Display.primary.opacity(0.65))
                }
                .font(Font.body.weight(.bold))
            }
        }
        .padding(.vertical, 18)
        .frame(width: 60, height: height, alignment: .top)
        .background(backgroundColor)
        .cornerRadius(30)
        .onTapGesture(perform: handleTapGesture)
        .animation(AnimationPreset.Touch.expand)
    }

    private var formattedDate: String {
        data.date.toFormat("h a").lowercased()
    }

    private var splitDate: [String.SubSequence] {
        formattedDate.split(separator: " ")
    }

    private var formattedHour: String {
        String(splitDate.first ?? "")
    }

    private var amPm: String {
        guard splitDate.count >= 2 else {
            return .empty
        }

        return String(splitDate.last ?? "")
    }

    private func handleTapGesture() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()

        expanded.toggle()

        collapseAfter(seconds: 4)
    }

    private func collapseAfter(seconds: Double) {
        guard expanded else {
            return
        }

        workItemService.pendingWorkItem?.cancel()

        let requestWorkItem = DispatchWorkItem {
            self.expanded = false
        }

        workItemService.pendingWorkItem = requestWorkItem

        DispatchQueue.main.asyncAfter(
            deadline: .now() + seconds,
            execute: requestWorkItem
        )
    }

    private var backgroundColor: Color {
        expanded ? AppColor.Display.primary.opacity(0.1) : AppColor.Control.viewBackground.opacity(0.06)
    }

    private var height: CGFloat {
        expanded ? 140 : 128
    }

    private func FixedSizeText(_ text: String) -> some View {
        Text(text)
            .lineLimit(1)
            .fixedSize()
    }

    private func getWindSpeedText() -> String {
        guard let windSpeed = data.windSpeed else {
            return "N/A"
        }

        if windSpeed.isInt {
            return "\(windSpeed) \(data.windSpeedUnits)"
        }

        return "Calm"
    }

    class WorkItemService {
        var pendingWorkItem: DispatchWorkItem?
    }
}

extension HourlyForecastItem: Equatable {
    static func == (lhs: HourlyForecastItem, rhs: HourlyForecastItem) -> Bool {
        lhs.data == rhs.data && lhs.sizeCategory == rhs.sizeCategory
    }
}

struct HourlyForecastItem_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastItem(
            data: HourlyForecastItemData(
                date: DateInRegion(),
                symbolName: "cloud.rain.fill",
                temperature: 24,
                temperatureUnits: "C",
                windSpeedUnits: "km/h",
                windSpeed: "32",
                pop: "Nil"
            )
        )
    }
}
