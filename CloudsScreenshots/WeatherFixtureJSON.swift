//
//  WeatherFixtureJSON.swift
//  CloudsScreenshots
//
//  Created by Lukas Romsicki on 2020-04-30.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct WeatherFixtureJSON {
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
                  "title": "Wind Warning",
                  "time": 1588277561,
                  "type": "warning",
                  "url": "https://weather.gc.ca"
                },
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
                "sunsetTime": 1589502240,
                "highTemperature": 27,
                "lowTemperature": 16
              },
              "currently": {
                "__typename": "Currently",
                "time": 1588291200,
                "summary": "Partly cloudy",
                "icon": {
                  "__typename": "Icon",
                  "style": "partlyCloudy",
                  "colorScheme": "clearSky"
                },
                "temperature": 21,
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
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 18,
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
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 16,
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
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 15,
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
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 13,
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
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 13,
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
                  "temperature": 13,
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
                  "time": 1588316400,
                  "summary": "Rain",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 13,
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
                  "time": 1588320000,
                  "summary": "Rain",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 13,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 1,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "15"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588323600,
                  "summary": "Rain",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 12,
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
                  "time": 1588327200,
                  "summary": "Rain",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 12,
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
                  "time": 1588330800,
                  "summary": "Showers",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 12,
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
                  "time": 1588334400,
                  "summary": "Showers",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 11,
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
                  "time": 1588338000,
                  "summary": "Showers",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 11,
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
                  "time": 1588341600,
                  "summary": "Showers",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 11,
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
                  "time": 1588345200,
                  "summary": "Showers",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 12,
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
                  "time": 1588348800,
                  "summary": "Chance of showers",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 12,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 0.4,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "20"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588352400,
                  "summary": "Chance of showers",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 12,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 0.4,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "20"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588356000,
                  "summary": "Chance of showers",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 13,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 0.4,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "20"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588359600,
                  "summary": "Chance of showers",
                  "icon": {
                    "__typename": "Icon",
                    "style": "rain",
                    "colorScheme": "wetCloud"
                  },
                  "temperature": 13,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 0.4,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "20"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588363200,
                  "summary": "Overcast",
                  "icon": {
                    "__typename": "Icon",
                    "style": "cloudy",
                    "colorScheme": "dryCloud"
                  },
                  "temperature": 13,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 0,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "30"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588366800,
                  "summary": "Overcast",
                  "icon": {
                    "__typename": "Icon",
                    "style": "cloudy",
                    "colorScheme": "dryCloud"
                  },
                  "temperature": 13,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 0,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "30"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588370400,
                  "summary": "Overcast",
                  "icon": {
                    "__typename": "Icon",
                    "style": "cloudy",
                    "colorScheme": "dryCloud"
                  },
                  "temperature": 13,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 0,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "20"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588374000,
                  "summary": "Cloudy",
                  "icon": {
                    "__typename": "Icon",
                    "style": "cloudy",
                    "colorScheme": "dryCloud"
                  },
                  "temperature": 14,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 0,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "20"
                  }
                },
                {
                  "__typename": "Hourly",
                  "time": 1588377600,
                  "summary": "Mainly cloudy",
                  "icon": {
                    "__typename": "Icon",
                    "style": "mainlyCloudy",
                    "colorScheme": "clearSky"
                  },
                  "temperature": 15,
                  "feelsLike": {
                    "__typename": "FeelsLike",
                    "temperature": null,
                    "type": null
                  },
                  "precipProbability": 0,
                  "wind": {
                    "__typename": "Wind",
                    "speed": "20"
                  }
                }
              ],
              "daily": [
                {
                  "__typename": "Daily",
                  "time": 1588219200,
                  "daytimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "Chance of showers",
                    "summaryClouds": "Cloudy with 30 percent chance of showers.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "rain",
                      "colorScheme": "wetCloud"
                    },
                    "temperature": 20,
                    "precipProbability": 0.3,
                    "wind": {
                      "__typename": "Wind",
                      "speed": null
                    }
                  },
                  "nighttimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "Periods of rain",
                    "summaryClouds": "Periods of rain.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "rain",
                      "colorScheme": "wetCloud"
                    },
                    "temperature": 7,
                    "precipProbability": null,
                    "wind": {
                      "__typename": "Wind",
                      "speed": null
                    }
                  }
                },
                {
                  "__typename": "Daily",
                  "time": 1588305600,
                  "daytimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "Chance of showers",
                    "summaryClouds": "Showers ending in the morning then cloudy with 40 percent chance of showers. Becoming a mix of sun and cloud late in the afternoon.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "rain",
                      "colorScheme": "wetCloud"
                    },
                    "temperature": 16,
                    "precipProbability": 0.4,
                    "wind": {
                      "__typename": "Wind",
                      "speed": "10"
                    }
                  },
                  "nighttimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "A few clouds",
                    "summaryClouds": "Clear. Becoming partly cloudy after midnight.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "mainlyClear",
                      "colorScheme": "night"
                    },
                    "temperature": 2,
                    "precipProbability": null,
                    "wind": {
                      "__typename": "Wind",
                      "speed": "20"
                    }
                  }
                },
                {
                  "__typename": "Daily",
                  "time": 1588392000,
                  "daytimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "Sunny",
                    "summaryClouds": "Sunny.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "clear",
                      "colorScheme": "clearSky"
                    },
                    "temperature": 20,
                    "precipProbability": null,
                    "wind": {
                      "__typename": "Wind",
                      "speed": null
                    }
                  },
                  "nighttimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "Chance of showers",
                    "summaryClouds": "Cloudy with 60 percent chance of showers.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "rain",
                      "colorScheme": "wetCloud"
                    },
                    "temperature": 8,
                    "precipProbability": 0.6,
                    "wind": {
                      "__typename": "Wind",
                      "speed": null
                    }
                  }
                },
                {
                  "__typename": "Daily",
                  "time": 1588478400,
                  "daytimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "Chance of showers",
                    "summaryClouds": "Cloudy with 30 percent chance of showers.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "rain",
                      "colorScheme": "wetCloud"
                    },
                    "temperature": 20,
                    "precipProbability": 0.3,
                    "wind": {
                      "__typename": "Wind",
                      "speed": null
                    }
                  },
                  "nighttimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "Periods of rain",
                    "summaryClouds": "Periods of rain.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "rain",
                      "colorScheme": "wetCloud"
                    },
                    "temperature": 7,
                    "precipProbability": null,
                    "wind": {
                      "__typename": "Wind",
                      "speed": null
                    }
                  }
                },
                {
                  "__typename": "Daily",
                  "time": 1588564800,
                  "daytimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "Rain",
                    "summaryClouds": "Rain.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "rain",
                      "colorScheme": "wetCloud"
                    },
                    "temperature": 11,
                    "precipProbability": null,
                    "wind": {
                      "__typename": "Wind",
                      "speed": null
                    }
                  },
                  "nighttimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "Cloudy periods",
                    "summaryClouds": "Cloudy periods.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "partlyCloudy",
                      "colorScheme": "night"
                    },
                    "temperature": 1,
                    "precipProbability": null,
                    "wind": {
                      "__typename": "Wind",
                      "speed": null
                    }
                  }
                },
                {
                  "__typename": "Daily",
                  "time": 1588651200,
                  "daytimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "A mix of sun and cloud",
                    "summaryClouds": "A mix of sun and cloud.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "partlyCloudy",
                      "colorScheme": "clearSky"
                    },
                    "temperature": 14,
                    "precipProbability": null,
                    "wind": {
                      "__typename": "Wind",
                      "speed": null
                    }
                  },
                  "nighttimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "Cloudy periods",
                    "summaryClouds": "Cloudy periods.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "partlyCloudy",
                      "colorScheme": "night"
                    },
                    "temperature": 3,
                    "precipProbability": null,
                    "wind": {
                      "__typename": "Wind",
                      "speed": null
                    }
                  }
                },
                {
                  "__typename": "Daily",
                  "time": 1588737600,
                  "daytimeConditions": {
                    "__typename": "HalfDayCondition",
                    "summary": "A mix of sun and cloud",
                    "summaryClouds": "A mix of sun and cloud.",
                    "icon": {
                      "__typename": "Icon",
                      "style": "partlyCloudy",
                      "colorScheme": "clearSky"
                    },
                    "temperature": 16,
                    "precipProbability": null,
                    "wind": {
                      "__typename": "Wind",
                      "speed": null
                    }
                  },
                  "nighttimeConditions": null
                }
              ]
            }
          }
        }
    """

    var jsonData: Data? {
        return jsonString.data(using: .utf8)
    }
}
