//
//  HourlyForecastView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftDate
import SwiftUI

struct HourlyForecastView: View {
    let viewModel: HourlyForecastViewModel

    @State var expanded: Bool = false

    private let workItemService = WorkItemService()

    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                FixedSizeText("\(viewModel.date.toFormat("h"))")
                FixedSizeText("\(viewModel.date.toFormat("a").prefix(1).lowercased())")
                    .foregroundColor(Color.primary.opacity(0.65))
            }
            .font(Font.system(size: 14).weight(.bold))

            Spacer()

            if expanded {
                VStack(alignment: .center, spacing: 4) {
                    Image(systemName: "wind").font(.system(size: 13, weight: .bold))
                    FixedSizeText(getWindSpeedText())
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(.primary)
                }

                Spacer()

                VStack(alignment: .center, spacing: 4) {
                    Image(systemName: "umbrella.fill").font(.system(size: 13, weight: .bold))
                    FixedSizeText("\(viewModel.pop ?? 0)%")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(.primary)
                }

            } else {
                ForecastWeatherIcon(name: self.viewModel.symbolName)

                Spacer()

                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text("\(viewModel.temperature)")
                    Text("°")
                        .foregroundColor(Color.primary.opacity(0.64))
                }
                .font(Font.system(size: 16).weight(.semibold))
            }
        }
        .padding(.vertical, 18)
        .frame(width: 60, height: height, alignment: .top)
        .animation(HourlyForecastView.expandAnimation)
        .background(backgroundColor)
        .cornerRadius(30)
        .onTapGesture(perform: handleTapGesture)
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
        (expanded ? Color.white : Color.black).opacity(0.1)
    }

    private var height: CGFloat {
        expanded ? 140 : 128
    }

    private static var expandAnimation: Animation {
        .easeInOut(duration: 0.17)
    }

    private func FixedSizeText(_ text: String) -> some View {
        Text(text)
            .lineLimit(1)
            .fixedSize()
    }

    private func getWindSpeedText() -> String {
        if let windSpeed = viewModel.windSpeed {
            return "\(windSpeed) \(viewModel.windSpeedUnits)"
        }

        return "Calm"
    }

    enum AmPm: String {
        case am
        case pm
    }

    class WorkItemService {
        var pendingWorkItem: DispatchWorkItem?
    }
}

#if DEBUG
struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView(
            viewModel: HourlyForecastViewModel(
                date: DateInRegion(),
                symbolName: "cloud.rain.fill",
                temperature: 24,
                temperatureUnits: "C",
                windSpeedUnits: "km/h",
                windSpeed: "32",
                pop: 54
            )
        )
    }
}
#endif
