//
//  WeatherLocationItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeatherLocationItem: View {
    var style: Style
    var location: StoredLocation
    var weather: ShortFormWeather?
    var favorite: Bool = false
    var isEditing: Bool = false

    var action: (StoredLocation) -> Void
    var onDelete: ((StoredLocation) -> Void)?

    internal enum Style: String {
        case current
        case favorite

        var symbolName: String {
            switch self {
            case .current:
                return SFSymbol.locationFilled
            case .favorite:
                return SFSymbol.starFilled
            }
        }
    }

    var body: some View {
        HStack(alignment: .center, spacing: 22) {
            LocationItem(color: color, action: { self.action(self.location) }) {
                LocationItemIcon(name: self.style == .favorite ? SFSymbol.starFilled : self.style.symbolName)
                LocationItemLabels(title: self.location.name, subtitle: self.location.regionName)
                Spacer()
                LocationItemTemperature(text: self.temperatureLabelText)
            }

            if isEditing {
                LocationItemDeleteButton {
                    self.onDelete?(self.location)
                }
                .padding(.trailing, 6)
                .transition(AnyTransition.opacity.animation(.easeInOut))
            }
        }
    }

    private var temperatureLabelText: String {
        guard let temperature = weather?.temperature else {
            return .empty
        }

        return "\(Int(temperature.rounded() + 0.0))°"
    }

    private var color: Color? {
        guard let colorCode = weather?.iconCode else {
            return nil
        }

        return AppColor.Weather.schemes[code: colorCode].lower.color
    }
}

extension WeatherLocationItem: Equatable {
    static func == (lhs: WeatherLocationItem, rhs: WeatherLocationItem) -> Bool {
        lhs.style == rhs.style
            && lhs.location == rhs.location
            && lhs.weather == rhs.weather
            && lhs.favorite == rhs.favorite
            && lhs.isEditing == rhs.isEditing
    }
}

struct LocationItemWithWeather_Previews: PreviewProvider {
    static var previews: some View {
        WeatherLocationItem(
            style: .current,
            location: StoredLocation(
                name: "Ottawa",
                regionName: "ON, Canada",
                coordinate: .init()
            ),
            weather: nil,
            action: { _ in },
            onDelete: { _ in }
        )
    }
}
