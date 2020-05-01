//
//  VancouverWeatherFixtureJSON.swift
//  CloudsScreenshots
//
//  Created by Lukas Romsicki on 2020-04-30.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct VancouverWeatherFixtureJSON {
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
              "alerts": [
                {
                  "__typename": "Alert",
                  "title": "Special Weather Statement",
                  "time": 1588277561,
                  "type": "statement",
                  "url": "https://weather.gc.ca"
                }
              ],
              "today": {
                "__typename": "Today",
                "sunriseTime": 1588254720,
                "sunsetTime": 1589502340,
                "highTemperature": null,
                "lowTemperature": 12
              },
              "currently": {
                "__typename": "Currently",
                "time": 1588291200,
                "summary": "Cloudy",
                "icon": {
                  "__typename": "Icon",
                  "style": "cloudy",
                  "colorScheme": "dryCloud"
                },
                "temperature": 24,
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
              "hourly": [
                {
                  "__typename": "Hourly",
                  "time": 1588294800,
                  "summary": "Periods of rain",
                  "icon": {
                    "__typename": "Icon",
                    "style": "cloudy",
                    "colorScheme": "dryCloud"
                  },
                  "temperature": 24,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 1,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "20"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588298400,
                  "summary": "Rain",
                  "icon": {
                    "__typename": "Icon",
                    "style": "cloudy",
                    "colorScheme": "dryCloud"
                  },
                  "temperature": 24,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 1,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "10"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588302000,
                  "summary": "Rain",
                  "icon": {
                    "__typename": "Icon",
                    "style": "clear",
                    "colorScheme": "night"
                  },
                  "temperature": 23,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 1,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "10"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588305600,
                  "summary": "Rain",
                  "icon": {
                    "__typename": "Icon",
                    "style": "clear",
                    "colorScheme": "night"
                  },
                  "temperature": 20,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 1,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "5"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588309200,
                  "summary": "Rain",
                  "icon": {
                    "__typename": "Icon",
                    "style": "clear",
                    "colorScheme": "night"
                  },
                  "temperature": 19,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 1,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "5"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588312800,
                  "summary": "Rain",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 19,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 1,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "10"
                  }
                }
              ],
              "daily": []
            }
          }
        }
    """

    var jsonData: Data? {
        return jsonString.data(using: .utf8)
    }
}
