//
//  LocationItem.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationItem: View {
    var style: Style
    var location: Location
    var weather: ShortFormWeather?
    var favorite: Bool = false

    var action: (Location) -> Void
    var onStar: ((Location) -> Void)?

    internal enum Style: String {
        case current
        case favorite
        case search

        var symbolName: String {
            switch self {
            case .current:
                return SFSymbol.locationFilled
            case .favorite:
                return SFSymbol.starFilled
            case .search:
                return SFSymbol.mapFilled
            }
        }
    }

    var body: some View {
        Button(action: { self.action(self.location) }) {
            HStack(alignment: .center, spacing: Dimension.Spacing.barItems) {
                if style == .favorite {
                    LocationItemStarButton(isHighlighted: true, monochrome: true) {
                        self.onStar?(self.location)
                    }
                } else {
                    LocationItemIcon(name: style.symbolName)
                }

                LocationItemLabels(title: self.location.name, subtitle: self.location.regionName)
                Spacer()

                if style == .search {
                    LocationItemStarButton(isHighlighted: self.favorite) {
                        self.onStar?(self.location)
                    }
                } else {
                    LocationItemTemperature(text: self.temperatureLabelText)
                }
            }
            .padding(.horizontal, 20)
            .frame(height: Dimension.LocationPicker.itemHeight)
            .background(color ?? defaultColor)
            .cornerRadius(14)
            .animation(AnimationPreset.Touch.shrink)
        }
        .buttonStyle(PlainButtonStyle())
    }

    private var defaultColor: Color {
        Color(white: 0.09)
    }

    private var temperatureLabelText: String {
        guard let temperature = weather?.temperature else {
            return .empty
        }

        return "\(Int(temperature.rounded() + 0.0))°"
    }

    private static let colorPrefix = "color"

    private var color: Color? {
        guard let colorCode = weather?.iconCode else {
            return nil
        }

        return Color("\(Self.colorPrefix)-\(colorCode)-low")
    }
}

extension LocationItem: Equatable {
    static func == (lhs: LocationItem, rhs: LocationItem) -> Bool {
        lhs.style == rhs.style
            && lhs.location == rhs.location
            && lhs.weather == rhs.weather
            && lhs.favorite == rhs.favorite
    }
}

struct LocationItemWithWeather_Previews: PreviewProvider {
    static var previews: some View {
        LocationItem(
            style: .current,
            location: Location(
                name: "Ottawa",
                regionName: "ON, Canada",
                coordinate: .init(latitude: 0.0, longitude: 0.0)
            ),
            weather: nil,
            action: { _ in },
            onStar: { _ in }
        )
    }
}
