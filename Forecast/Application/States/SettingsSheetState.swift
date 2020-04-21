//
//  SettingsSheetState.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-07.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Combine
import Foundation

final class SettingsSheetState: ObservableObject {
    @Published var presented: Bool = false

    let radarSourceDidChange = PassthroughSubject<Void, Never>()

    var isImperial: Bool {
        get {
            UserDefaults.standard.bool(forKey: Key.isImperial)
        }

        set {
            objectWillChange.send()
            UserDefaults.standard.set(newValue, forKey: Key.isImperial)
        }
    }

    var radarSource: RadarProvider {
        get {
            if let value = UserDefaults.standard.string(forKey: Key.radarProvider) {
                return RadarProvider(rawValue: value) ?? .msc
            }

            return .msc
        }

        set {
            objectWillChange.send()
            radarSourceDidChange.send()
            UserDefaults.standard.set(newValue.rawValue, forKey: Key.radarProvider)
        }
    }

    var radarOpacity: Double {
        get {
            let value = UserDefaults.standard.double(forKey: Key.radarOpacity)
            return value == 0 ? 0.75 : value
        }

        set {
            objectWillChange.send()
            UserDefaults.standard.set(newValue, forKey: Key.radarOpacity)
        }
    }

    private final class Key {
        public static let isImperial: String = "is_imperial"
        public static let radarProvider: String = "radar_provider"
        public static let radarOpacity: String = "radar_opacity"
    }
}
