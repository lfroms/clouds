//
//  RandomWeatherFixtureJSON.swift
//  CloudsScreenshots
//
//  Created by Lukas Romsicki on 2020-04-30.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct RandomWeatherFixtureJSON {
    private static func randomTemperature() -> Double {
        .random(in: 15...25)
    }

    private static func randomColorScheme() -> String {
        ["dryCloud", "clearSky", "night"].randomElement()!
    }

    let jsonString = """
        {
          "data": {
            "weather": {
              "__typename": "Weather",
              "location": {
                "__typename": "Location",
                "stationName": "Ottawa Macdonald-Cartier Int'l Airport",
                "coordinate": {
                  "__typename": "Coordinate",
                  "latitude": 45.33,
                  "longitude": -75.58
                }
              },
              "alerts": [],
              "today": {
                "__typename": "Today",
                "sunriseTime": 1588254720,
                "sunsetTime": 1588306020,
                "highTemperature": null,
                "lowTemperature": 16
              },
              "currently": {
                "__typename": "Currently",
                "time": 1588291200,
                "summary": "Partly cloudy",
                "icon": {
                  "__typename": "Icon",
                  "style": "partlyCloudy",
                  "colorScheme": "\(randomColorScheme())"
                },
                "temperature": \(randomTemperature()),
                "humidity": 0.76,
                "pressure": {
                  "__typename": "Pressure",
                  "value": 101.5
                },
                "feelsLike": {
                  "__typename": "FeelsLike",
                  "temperature": 25.2,
                  "type": "humidex"
                },
                "wind": {
                  "__typename": "Wind",
                  "speed": "28",
                  "direction": "ESE",
                  "gust": null
                },
                "visibility": 24.1,
                "dewPoint": 14.5
              },
              "hourly": [],
              "daily": []
            }
          }
        }
    """

    var jsonData: Data? {
        return jsonString.data(using: .utf8)
    }
}
