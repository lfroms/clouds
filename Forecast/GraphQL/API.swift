// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum AlertType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case advisory
  case warning
  case watch
  case ended
  case statement
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "advisory": self = .advisory
      case "warning": self = .warning
      case "watch": self = .watch
      case "ended": self = .ended
      case "statement": self = .statement
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .advisory: return "advisory"
      case .warning: return "warning"
      case .watch: return "watch"
      case .ended: return "ended"
      case .statement: return "statement"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: AlertType, rhs: AlertType) -> Bool {
    switch (lhs, rhs) {
      case (.advisory, .advisory): return true
      case (.warning, .warning): return true
      case (.watch, .watch): return true
      case (.ended, .ended): return true
      case (.statement, .statement): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [AlertType] {
    return [
      .advisory,
      .warning,
      .watch,
      .ended,
      .statement,
    ]
  }
}

public enum IconStyle: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case clear
  case mainlyClear
  case partlyCloudy
  case mainlyCloudy
  case cloudy
  case rain
  case flurries
  case snow
  case thunderstorm
  case fog
  case driftingSnow
  case iceCrystals
  case hail
  case funnel
  case windy
  case particulate
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "clear": self = .clear
      case "mainlyClear": self = .mainlyClear
      case "partlyCloudy": self = .partlyCloudy
      case "mainlyCloudy": self = .mainlyCloudy
      case "cloudy": self = .cloudy
      case "rain": self = .rain
      case "flurries": self = .flurries
      case "snow": self = .snow
      case "thunderstorm": self = .thunderstorm
      case "fog": self = .fog
      case "driftingSnow": self = .driftingSnow
      case "iceCrystals": self = .iceCrystals
      case "hail": self = .hail
      case "funnel": self = .funnel
      case "windy": self = .windy
      case "particulate": self = .particulate
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .clear: return "clear"
      case .mainlyClear: return "mainlyClear"
      case .partlyCloudy: return "partlyCloudy"
      case .mainlyCloudy: return "mainlyCloudy"
      case .cloudy: return "cloudy"
      case .rain: return "rain"
      case .flurries: return "flurries"
      case .snow: return "snow"
      case .thunderstorm: return "thunderstorm"
      case .fog: return "fog"
      case .driftingSnow: return "driftingSnow"
      case .iceCrystals: return "iceCrystals"
      case .hail: return "hail"
      case .funnel: return "funnel"
      case .windy: return "windy"
      case .particulate: return "particulate"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: IconStyle, rhs: IconStyle) -> Bool {
    switch (lhs, rhs) {
      case (.clear, .clear): return true
      case (.mainlyClear, .mainlyClear): return true
      case (.partlyCloudy, .partlyCloudy): return true
      case (.mainlyCloudy, .mainlyCloudy): return true
      case (.cloudy, .cloudy): return true
      case (.rain, .rain): return true
      case (.flurries, .flurries): return true
      case (.snow, .snow): return true
      case (.thunderstorm, .thunderstorm): return true
      case (.fog, .fog): return true
      case (.driftingSnow, .driftingSnow): return true
      case (.iceCrystals, .iceCrystals): return true
      case (.hail, .hail): return true
      case (.funnel, .funnel): return true
      case (.windy, .windy): return true
      case (.particulate, .particulate): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [IconStyle] {
    return [
      .clear,
      .mainlyClear,
      .partlyCloudy,
      .mainlyCloudy,
      .cloudy,
      .rain,
      .flurries,
      .snow,
      .thunderstorm,
      .fog,
      .driftingSnow,
      .iceCrystals,
      .hail,
      .funnel,
      .windy,
      .particulate,
    ]
  }
}

public enum ColorScheme: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case clearSky
  case dryCloud
  case wetCloud
  case storm
  case night
  case particulate
  case liquid
  case empty
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "clearSky": self = .clearSky
      case "dryCloud": self = .dryCloud
      case "wetCloud": self = .wetCloud
      case "storm": self = .storm
      case "night": self = .night
      case "particulate": self = .particulate
      case "liquid": self = .liquid
      case "empty": self = .empty
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .clearSky: return "clearSky"
      case .dryCloud: return "dryCloud"
      case .wetCloud: return "wetCloud"
      case .storm: return "storm"
      case .night: return "night"
      case .particulate: return "particulate"
      case .liquid: return "liquid"
      case .empty: return "empty"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ColorScheme, rhs: ColorScheme) -> Bool {
    switch (lhs, rhs) {
      case (.clearSky, .clearSky): return true
      case (.dryCloud, .dryCloud): return true
      case (.wetCloud, .wetCloud): return true
      case (.storm, .storm): return true
      case (.night, .night): return true
      case (.particulate, .particulate): return true
      case (.liquid, .liquid): return true
      case (.empty, .empty): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ColorScheme] {
    return [
      .clearSky,
      .dryCloud,
      .wetCloud,
      .storm,
      .night,
      .particulate,
      .liquid,
      .empty,
    ]
  }
}

public enum FeelsLikeType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case humidex
  case windChill
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "humidex": self = .humidex
      case "windChill": self = .windChill
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .humidex: return "humidex"
      case .windChill: return "windChill"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: FeelsLikeType, rhs: FeelsLikeType) -> Bool {
    switch (lhs, rhs) {
      case (.humidex, .humidex): return true
      case (.windChill, .windChill): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [FeelsLikeType] {
    return [
      .humidex,
      .windChill,
    ]
  }
}

public enum RadarProvider: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case environmentCanada
  case rainviewer
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "environmentCanada": self = .environmentCanada
      case "rainviewer": self = .rainviewer
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .environmentCanada: return "environmentCanada"
      case .rainviewer: return "rainviewer"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: RadarProvider, rhs: RadarProvider) -> Bool {
    switch (lhs, rhs) {
      case (.environmentCanada, .environmentCanada): return true
      case (.rainviewer, .rainviewer): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [RadarProvider] {
    return [
      .environmentCanada,
      .rainviewer,
    ]
  }
}

public final class WeatherQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Weather($latitude: Float!, $longitude: Float!) {
      weather(latitude: $latitude, longitude: $longitude) {
        __typename
        location {
          __typename
          stationName
          coordinate {
            __typename
            latitude
            longitude
          }
        }
        alerts {
          __typename
          title
          time
          type
          url
        }
        today {
          __typename
          sunriseTime
          sunsetTime
          highTemperature
          lowTemperature
        }
        currently {
          __typename
          time
          summary
          icon {
            __typename
            style
            colorScheme
          }
          temperature
          humidity
          pressure {
            __typename
            value
          }
          feelsLike {
            __typename
            temperature
            type
          }
          wind {
            __typename
            speed
            direction
            gust
          }
          visibility
          dewPoint
        }
        hourly {
          __typename
          time
          summary
          icon {
            __typename
            style
            colorScheme
          }
          temperature
          feelsLike {
            __typename
            temperature
            type
          }
          precipProbability
          wind {
            __typename
            speed
          }
        }
        daily {
          __typename
          time
          daytimeConditions {
            __typename
            summary
            summaryClouds
            icon {
              __typename
              style
              colorScheme
            }
            temperature
            precipProbability
            wind {
              __typename
              speed
            }
          }
          nighttimeConditions {
            __typename
            summary
            summaryClouds
            icon {
              __typename
              style
              colorScheme
            }
            temperature
            precipProbability
            wind {
              __typename
              speed
            }
          }
        }
      }
    }
    """

  public let operationName: String = "Weather"

  public var latitude: Double
  public var longitude: Double

  public init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }

  public var variables: GraphQLMap? {
    return ["latitude": latitude, "longitude": longitude]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("weather", arguments: ["latitude": GraphQLVariable("latitude"), "longitude": GraphQLVariable("longitude")], type: .object(Weather.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(weather: Weather? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "weather": weather.flatMap { (value: Weather) -> ResultMap in value.resultMap }])
    }

    /// Returns the weather for a specific location.
    public var weather: Weather? {
      get {
        return (resultMap["weather"] as? ResultMap).flatMap { Weather(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "weather")
      }
    }

    public struct Weather: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Weather"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.object(Location.selections))),
        GraphQLField("alerts", type: .nonNull(.list(.nonNull(.object(Alert.selections))))),
        GraphQLField("today", type: .nonNull(.object(Today.selections))),
        GraphQLField("currently", type: .nonNull(.object(Currently.selections))),
        GraphQLField("hourly", type: .nonNull(.list(.nonNull(.object(Hourly.selections))))),
        GraphQLField("daily", type: .nonNull(.list(.nonNull(.object(Daily.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(location: Location, alerts: [Alert], today: Today, currently: Currently, hourly: [Hourly], daily: [Daily]) {
        self.init(unsafeResultMap: ["__typename": "Weather", "location": location.resultMap, "alerts": alerts.map { (value: Alert) -> ResultMap in value.resultMap }, "today": today.resultMap, "currently": currently.resultMap, "hourly": hourly.map { (value: Hourly) -> ResultMap in value.resultMap }, "daily": daily.map { (value: Daily) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var location: Location {
        get {
          return Location(unsafeResultMap: resultMap["location"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "location")
        }
      }

      public var alerts: [Alert] {
        get {
          return (resultMap["alerts"] as! [ResultMap]).map { (value: ResultMap) -> Alert in Alert(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Alert) -> ResultMap in value.resultMap }, forKey: "alerts")
        }
      }

      public var today: Today {
        get {
          return Today(unsafeResultMap: resultMap["today"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "today")
        }
      }

      public var currently: Currently {
        get {
          return Currently(unsafeResultMap: resultMap["currently"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "currently")
        }
      }

      public var hourly: [Hourly] {
        get {
          return (resultMap["hourly"] as! [ResultMap]).map { (value: ResultMap) -> Hourly in Hourly(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Hourly) -> ResultMap in value.resultMap }, forKey: "hourly")
        }
      }

      public var daily: [Daily] {
        get {
          return (resultMap["daily"] as! [ResultMap]).map { (value: ResultMap) -> Daily in Daily(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Daily) -> ResultMap in value.resultMap }, forKey: "daily")
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("stationName", type: .scalar(String.self)),
          GraphQLField("coordinate", type: .nonNull(.object(Coordinate.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(stationName: String? = nil, coordinate: Coordinate) {
          self.init(unsafeResultMap: ["__typename": "Location", "stationName": stationName, "coordinate": coordinate.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var stationName: String? {
          get {
            return resultMap["stationName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "stationName")
          }
        }

        public var coordinate: Coordinate {
          get {
            return Coordinate(unsafeResultMap: resultMap["coordinate"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "coordinate")
          }
        }

        public struct Coordinate: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Coordinate"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("latitude", type: .nonNull(.scalar(Double.self))),
            GraphQLField("longitude", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(latitude: Double, longitude: Double) {
            self.init(unsafeResultMap: ["__typename": "Coordinate", "latitude": latitude, "longitude": longitude])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var latitude: Double {
            get {
              return resultMap["latitude"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "latitude")
            }
          }

          public var longitude: Double {
            get {
              return resultMap["longitude"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "longitude")
            }
          }
        }
      }

      public struct Alert: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Alert"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("time", type: .nonNull(.scalar(Double.self))),
          GraphQLField("type", type: .nonNull(.scalar(AlertType.self))),
          GraphQLField("url", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String, time: Double, type: AlertType, url: String) {
          self.init(unsafeResultMap: ["__typename": "Alert", "title": title, "time": time, "type": type, "url": url])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var time: Double {
          get {
            return resultMap["time"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "time")
          }
        }

        public var type: AlertType {
          get {
            return resultMap["type"]! as! AlertType
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }
      }

      public struct Today: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Today"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("sunriseTime", type: .scalar(Double.self)),
          GraphQLField("sunsetTime", type: .scalar(Double.self)),
          GraphQLField("highTemperature", type: .scalar(Double.self)),
          GraphQLField("lowTemperature", type: .scalar(Double.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(sunriseTime: Double? = nil, sunsetTime: Double? = nil, highTemperature: Double? = nil, lowTemperature: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "Today", "sunriseTime": sunriseTime, "sunsetTime": sunsetTime, "highTemperature": highTemperature, "lowTemperature": lowTemperature])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var sunriseTime: Double? {
          get {
            return resultMap["sunriseTime"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "sunriseTime")
          }
        }

        public var sunsetTime: Double? {
          get {
            return resultMap["sunsetTime"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "sunsetTime")
          }
        }

        public var highTemperature: Double? {
          get {
            return resultMap["highTemperature"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "highTemperature")
          }
        }

        public var lowTemperature: Double? {
          get {
            return resultMap["lowTemperature"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lowTemperature")
          }
        }
      }

      public struct Currently: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Currently"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("time", type: .nonNull(.scalar(Double.self))),
          GraphQLField("summary", type: .scalar(String.self)),
          GraphQLField("icon", type: .nonNull(.object(Icon.selections))),
          GraphQLField("temperature", type: .scalar(Double.self)),
          GraphQLField("humidity", type: .scalar(Double.self)),
          GraphQLField("pressure", type: .nonNull(.object(Pressure.selections))),
          GraphQLField("feelsLike", type: .nonNull(.object(FeelsLike.selections))),
          GraphQLField("wind", type: .nonNull(.object(Wind.selections))),
          GraphQLField("visibility", type: .scalar(Double.self)),
          GraphQLField("dewPoint", type: .scalar(Double.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(time: Double, summary: String? = nil, icon: Icon, temperature: Double? = nil, humidity: Double? = nil, pressure: Pressure, feelsLike: FeelsLike, wind: Wind, visibility: Double? = nil, dewPoint: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "Currently", "time": time, "summary": summary, "icon": icon.resultMap, "temperature": temperature, "humidity": humidity, "pressure": pressure.resultMap, "feelsLike": feelsLike.resultMap, "wind": wind.resultMap, "visibility": visibility, "dewPoint": dewPoint])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var time: Double {
          get {
            return resultMap["time"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "time")
          }
        }

        public var summary: String? {
          get {
            return resultMap["summary"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "summary")
          }
        }

        public var icon: Icon {
          get {
            return Icon(unsafeResultMap: resultMap["icon"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "icon")
          }
        }

        public var temperature: Double? {
          get {
            return resultMap["temperature"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "temperature")
          }
        }

        public var humidity: Double? {
          get {
            return resultMap["humidity"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "humidity")
          }
        }

        public var pressure: Pressure {
          get {
            return Pressure(unsafeResultMap: resultMap["pressure"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pressure")
          }
        }

        public var feelsLike: FeelsLike {
          get {
            return FeelsLike(unsafeResultMap: resultMap["feelsLike"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "feelsLike")
          }
        }

        public var wind: Wind {
          get {
            return Wind(unsafeResultMap: resultMap["wind"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "wind")
          }
        }

        public var visibility: Double? {
          get {
            return resultMap["visibility"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "visibility")
          }
        }

        public var dewPoint: Double? {
          get {
            return resultMap["dewPoint"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "dewPoint")
          }
        }

        public struct Icon: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Icon"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("style", type: .scalar(IconStyle.self)),
            GraphQLField("colorScheme", type: .nonNull(.scalar(ColorScheme.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(style: IconStyle? = nil, colorScheme: ColorScheme) {
            self.init(unsafeResultMap: ["__typename": "Icon", "style": style, "colorScheme": colorScheme])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var style: IconStyle? {
            get {
              return resultMap["style"] as? IconStyle
            }
            set {
              resultMap.updateValue(newValue, forKey: "style")
            }
          }

          public var colorScheme: ColorScheme {
            get {
              return resultMap["colorScheme"]! as! ColorScheme
            }
            set {
              resultMap.updateValue(newValue, forKey: "colorScheme")
            }
          }
        }

        public struct Pressure: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Pressure"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(Double.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: Double? = nil) {
            self.init(unsafeResultMap: ["__typename": "Pressure", "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: Double? {
            get {
              return resultMap["value"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }

        public struct FeelsLike: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FeelsLike"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("temperature", type: .scalar(Double.self)),
            GraphQLField("type", type: .scalar(FeelsLikeType.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(temperature: Double? = nil, type: FeelsLikeType? = nil) {
            self.init(unsafeResultMap: ["__typename": "FeelsLike", "temperature": temperature, "type": type])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var temperature: Double? {
            get {
              return resultMap["temperature"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "temperature")
            }
          }

          public var type: FeelsLikeType? {
            get {
              return resultMap["type"] as? FeelsLikeType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }
        }

        public struct Wind: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Wind"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speed", type: .scalar(String.self)),
            GraphQLField("direction", type: .scalar(String.self)),
            GraphQLField("gust", type: .scalar(Double.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speed: String? = nil, direction: String? = nil, gust: Double? = nil) {
            self.init(unsafeResultMap: ["__typename": "Wind", "speed": speed, "direction": direction, "gust": gust])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speed: String? {
            get {
              return resultMap["speed"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speed")
            }
          }

          public var direction: String? {
            get {
              return resultMap["direction"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "direction")
            }
          }

          public var gust: Double? {
            get {
              return resultMap["gust"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "gust")
            }
          }
        }
      }

      public struct Hourly: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Hourly"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("time", type: .nonNull(.scalar(Double.self))),
          GraphQLField("summary", type: .scalar(String.self)),
          GraphQLField("icon", type: .nonNull(.object(Icon.selections))),
          GraphQLField("temperature", type: .scalar(Double.self)),
          GraphQLField("feelsLike", type: .nonNull(.object(FeelsLike.selections))),
          GraphQLField("precipProbability", type: .scalar(Double.self)),
          GraphQLField("wind", type: .nonNull(.object(Wind.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(time: Double, summary: String? = nil, icon: Icon, temperature: Double? = nil, feelsLike: FeelsLike, precipProbability: Double? = nil, wind: Wind) {
          self.init(unsafeResultMap: ["__typename": "Hourly", "time": time, "summary": summary, "icon": icon.resultMap, "temperature": temperature, "feelsLike": feelsLike.resultMap, "precipProbability": precipProbability, "wind": wind.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var time: Double {
          get {
            return resultMap["time"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "time")
          }
        }

        public var summary: String? {
          get {
            return resultMap["summary"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "summary")
          }
        }

        public var icon: Icon {
          get {
            return Icon(unsafeResultMap: resultMap["icon"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "icon")
          }
        }

        public var temperature: Double? {
          get {
            return resultMap["temperature"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "temperature")
          }
        }

        public var feelsLike: FeelsLike {
          get {
            return FeelsLike(unsafeResultMap: resultMap["feelsLike"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "feelsLike")
          }
        }

        public var precipProbability: Double? {
          get {
            return resultMap["precipProbability"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "precipProbability")
          }
        }

        public var wind: Wind {
          get {
            return Wind(unsafeResultMap: resultMap["wind"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "wind")
          }
        }

        public struct Icon: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Icon"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("style", type: .scalar(IconStyle.self)),
            GraphQLField("colorScheme", type: .nonNull(.scalar(ColorScheme.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(style: IconStyle? = nil, colorScheme: ColorScheme) {
            self.init(unsafeResultMap: ["__typename": "Icon", "style": style, "colorScheme": colorScheme])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var style: IconStyle? {
            get {
              return resultMap["style"] as? IconStyle
            }
            set {
              resultMap.updateValue(newValue, forKey: "style")
            }
          }

          public var colorScheme: ColorScheme {
            get {
              return resultMap["colorScheme"]! as! ColorScheme
            }
            set {
              resultMap.updateValue(newValue, forKey: "colorScheme")
            }
          }
        }

        public struct FeelsLike: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FeelsLike"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("temperature", type: .scalar(Double.self)),
            GraphQLField("type", type: .scalar(FeelsLikeType.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(temperature: Double? = nil, type: FeelsLikeType? = nil) {
            self.init(unsafeResultMap: ["__typename": "FeelsLike", "temperature": temperature, "type": type])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var temperature: Double? {
            get {
              return resultMap["temperature"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "temperature")
            }
          }

          public var type: FeelsLikeType? {
            get {
              return resultMap["type"] as? FeelsLikeType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }
        }

        public struct Wind: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Wind"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speed", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speed: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Wind", "speed": speed])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speed: String? {
            get {
              return resultMap["speed"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speed")
            }
          }
        }
      }

      public struct Daily: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Daily"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("time", type: .nonNull(.scalar(Double.self))),
          GraphQLField("daytimeConditions", type: .object(DaytimeCondition.selections)),
          GraphQLField("nighttimeConditions", type: .object(NighttimeCondition.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(time: Double, daytimeConditions: DaytimeCondition? = nil, nighttimeConditions: NighttimeCondition? = nil) {
          self.init(unsafeResultMap: ["__typename": "Daily", "time": time, "daytimeConditions": daytimeConditions.flatMap { (value: DaytimeCondition) -> ResultMap in value.resultMap }, "nighttimeConditions": nighttimeConditions.flatMap { (value: NighttimeCondition) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var time: Double {
          get {
            return resultMap["time"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "time")
          }
        }

        public var daytimeConditions: DaytimeCondition? {
          get {
            return (resultMap["daytimeConditions"] as? ResultMap).flatMap { DaytimeCondition(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "daytimeConditions")
          }
        }

        public var nighttimeConditions: NighttimeCondition? {
          get {
            return (resultMap["nighttimeConditions"] as? ResultMap).flatMap { NighttimeCondition(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "nighttimeConditions")
          }
        }

        public struct DaytimeCondition: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["HalfDayCondition"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("summary", type: .scalar(String.self)),
            GraphQLField("summaryClouds", type: .scalar(String.self)),
            GraphQLField("icon", type: .nonNull(.object(Icon.selections))),
            GraphQLField("temperature", type: .scalar(Double.self)),
            GraphQLField("precipProbability", type: .scalar(Double.self)),
            GraphQLField("wind", type: .nonNull(.object(Wind.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(summary: String? = nil, summaryClouds: String? = nil, icon: Icon, temperature: Double? = nil, precipProbability: Double? = nil, wind: Wind) {
            self.init(unsafeResultMap: ["__typename": "HalfDayCondition", "summary": summary, "summaryClouds": summaryClouds, "icon": icon.resultMap, "temperature": temperature, "precipProbability": precipProbability, "wind": wind.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var summary: String? {
            get {
              return resultMap["summary"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "summary")
            }
          }

          public var summaryClouds: String? {
            get {
              return resultMap["summaryClouds"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "summaryClouds")
            }
          }

          public var icon: Icon {
            get {
              return Icon(unsafeResultMap: resultMap["icon"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "icon")
            }
          }

          public var temperature: Double? {
            get {
              return resultMap["temperature"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "temperature")
            }
          }

          public var precipProbability: Double? {
            get {
              return resultMap["precipProbability"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "precipProbability")
            }
          }

          public var wind: Wind {
            get {
              return Wind(unsafeResultMap: resultMap["wind"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "wind")
            }
          }

          public struct Icon: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Icon"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("style", type: .scalar(IconStyle.self)),
              GraphQLField("colorScheme", type: .nonNull(.scalar(ColorScheme.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(style: IconStyle? = nil, colorScheme: ColorScheme) {
              self.init(unsafeResultMap: ["__typename": "Icon", "style": style, "colorScheme": colorScheme])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var style: IconStyle? {
              get {
                return resultMap["style"] as? IconStyle
              }
              set {
                resultMap.updateValue(newValue, forKey: "style")
              }
            }

            public var colorScheme: ColorScheme {
              get {
                return resultMap["colorScheme"]! as! ColorScheme
              }
              set {
                resultMap.updateValue(newValue, forKey: "colorScheme")
              }
            }
          }

          public struct Wind: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Wind"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speed", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(speed: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Wind", "speed": speed])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var speed: String? {
              get {
                return resultMap["speed"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "speed")
              }
            }
          }
        }

        public struct NighttimeCondition: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["HalfDayCondition"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("summary", type: .scalar(String.self)),
            GraphQLField("summaryClouds", type: .scalar(String.self)),
            GraphQLField("icon", type: .nonNull(.object(Icon.selections))),
            GraphQLField("temperature", type: .scalar(Double.self)),
            GraphQLField("precipProbability", type: .scalar(Double.self)),
            GraphQLField("wind", type: .nonNull(.object(Wind.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(summary: String? = nil, summaryClouds: String? = nil, icon: Icon, temperature: Double? = nil, precipProbability: Double? = nil, wind: Wind) {
            self.init(unsafeResultMap: ["__typename": "HalfDayCondition", "summary": summary, "summaryClouds": summaryClouds, "icon": icon.resultMap, "temperature": temperature, "precipProbability": precipProbability, "wind": wind.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var summary: String? {
            get {
              return resultMap["summary"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "summary")
            }
          }

          public var summaryClouds: String? {
            get {
              return resultMap["summaryClouds"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "summaryClouds")
            }
          }

          public var icon: Icon {
            get {
              return Icon(unsafeResultMap: resultMap["icon"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "icon")
            }
          }

          public var temperature: Double? {
            get {
              return resultMap["temperature"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "temperature")
            }
          }

          public var precipProbability: Double? {
            get {
              return resultMap["precipProbability"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "precipProbability")
            }
          }

          public var wind: Wind {
            get {
              return Wind(unsafeResultMap: resultMap["wind"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "wind")
            }
          }

          public struct Icon: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Icon"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("style", type: .scalar(IconStyle.self)),
              GraphQLField("colorScheme", type: .nonNull(.scalar(ColorScheme.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(style: IconStyle? = nil, colorScheme: ColorScheme) {
              self.init(unsafeResultMap: ["__typename": "Icon", "style": style, "colorScheme": colorScheme])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var style: IconStyle? {
              get {
                return resultMap["style"] as? IconStyle
              }
              set {
                resultMap.updateValue(newValue, forKey: "style")
              }
            }

            public var colorScheme: ColorScheme {
              get {
                return resultMap["colorScheme"]! as! ColorScheme
              }
              set {
                resultMap.updateValue(newValue, forKey: "colorScheme")
              }
            }
          }

          public struct Wind: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Wind"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speed", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(speed: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Wind", "speed": speed])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var speed: String? {
              get {
                return resultMap["speed"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "speed")
              }
            }
          }
        }
      }
    }
  }
}

public final class WeatherLocationItemQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WeatherLocationItem($latitude: Float!, $longitude: Float!) {
      weather(latitude: $latitude, longitude: $longitude) {
        __typename
        currently {
          __typename
          temperature
          icon {
            __typename
            colorScheme
          }
        }
      }
    }
    """

  public let operationName: String = "WeatherLocationItem"

  public var latitude: Double
  public var longitude: Double

  public init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }

  public var variables: GraphQLMap? {
    return ["latitude": latitude, "longitude": longitude]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("weather", arguments: ["latitude": GraphQLVariable("latitude"), "longitude": GraphQLVariable("longitude")], type: .object(Weather.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(weather: Weather? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "weather": weather.flatMap { (value: Weather) -> ResultMap in value.resultMap }])
    }

    /// Returns the weather for a specific location.
    public var weather: Weather? {
      get {
        return (resultMap["weather"] as? ResultMap).flatMap { Weather(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "weather")
      }
    }

    public struct Weather: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Weather"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("currently", type: .nonNull(.object(Currently.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(currently: Currently) {
        self.init(unsafeResultMap: ["__typename": "Weather", "currently": currently.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var currently: Currently {
        get {
          return Currently(unsafeResultMap: resultMap["currently"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "currently")
        }
      }

      public struct Currently: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Currently"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("temperature", type: .scalar(Double.self)),
          GraphQLField("icon", type: .nonNull(.object(Icon.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(temperature: Double? = nil, icon: Icon) {
          self.init(unsafeResultMap: ["__typename": "Currently", "temperature": temperature, "icon": icon.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var temperature: Double? {
          get {
            return resultMap["temperature"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "temperature")
          }
        }

        public var icon: Icon {
          get {
            return Icon(unsafeResultMap: resultMap["icon"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "icon")
          }
        }

        public struct Icon: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Icon"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("colorScheme", type: .nonNull(.scalar(ColorScheme.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(colorScheme: ColorScheme) {
            self.init(unsafeResultMap: ["__typename": "Icon", "colorScheme": colorScheme])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var colorScheme: ColorScheme {
            get {
              return resultMap["colorScheme"]! as! ColorScheme
            }
            set {
              resultMap.updateValue(newValue, forKey: "colorScheme")
            }
          }
        }
      }
    }
  }
}

public final class RadarTimestampsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query RadarTimestamps($provider: RadarProvider!) {
      radarTimestamps(provider: $provider)
    }
    """

  public let operationName: String = "RadarTimestamps"

  public var provider: RadarProvider

  public init(provider: RadarProvider) {
    self.provider = provider
  }

  public var variables: GraphQLMap? {
    return ["provider": provider]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("radarTimestamps", arguments: ["provider": GraphQLVariable("provider")], type: .nonNull(.list(.nonNull(.scalar(Double.self))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(radarTimestamps: [Double]) {
      self.init(unsafeResultMap: ["__typename": "Query", "radarTimestamps": radarTimestamps])
    }

    /// Returns timestamps for the latest radar images.
    public var radarTimestamps: [Double] {
      get {
        return resultMap["radarTimestamps"]! as! [Double]
      }
      set {
        resultMap.updateValue(newValue, forKey: "radarTimestamps")
      }
    }
  }
}
