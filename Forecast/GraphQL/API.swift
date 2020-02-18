// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Coordinates.
public struct Coordinate: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - latitude
  ///   - longitude
  public init(latitude: Swift.Optional<Double?> = nil, longitude: Swift.Optional<Double?> = nil) {
    graphQLMap = ["latitude": latitude, "longitude": longitude]
  }

  public var latitude: Swift.Optional<Double?> {
    get {
      return graphQLMap["latitude"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var longitude: Swift.Optional<Double?> {
    get {
      return graphQLMap["longitude"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }
}

public enum Units: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case imperial
  case metric
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "imperial": self = .imperial
      case "metric": self = .metric
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .imperial: return "imperial"
      case .metric: return "metric"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Units, rhs: Units) -> Bool {
    switch (lhs, rhs) {
      case (.imperial, .imperial): return true
      case (.metric, .metric): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Units] {
    return [
      .imperial,
      .metric,
    ]
  }
}

public enum Language: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case e
  case f
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "e": self = .e
      case "f": self = .f
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .e: return "e"
      case .f: return "f"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Language, rhs: Language) -> Bool {
    switch (lhs, rhs) {
      case (.e, .e): return true
      case (.f, .f): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Language] {
    return [
      .e,
      .f,
    ]
  }
}

public enum WarningType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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

  public static func == (lhs: WarningType, rhs: WarningType) -> Bool {
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

  public static var allCases: [WarningType] {
    return [
      .advisory,
      .warning,
      .watch,
      .ended,
      .statement,
    ]
  }
}

public enum WarningPriority: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case urgent
  case high
  case medium
  case low
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "urgent": self = .urgent
      case "high": self = .high
      case "medium": self = .medium
      case "low": self = .low
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .urgent: return "urgent"
      case .high: return "high"
      case .medium: return "medium"
      case .low: return "low"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: WarningPriority, rhs: WarningPriority) -> Bool {
    switch (lhs, rhs) {
      case (.urgent, .urgent): return true
      case (.high, .high): return true
      case (.medium, .medium): return true
      case (.low, .low): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [WarningPriority] {
    return [
      .urgent,
      .high,
      .medium,
      .low,
    ]
  }
}

public final class FavoriteLocationsWeatherQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FavoriteLocationsWeather($coordinates: [Coordinate!]!, $units: Units!, $language: Language!) {
      bulkWeatherByCoordinates(coordinates: $coordinates, units: $units, language: $language) {
        __typename
        currentConditions {
          __typename
          temperature
          iconCode
        }
      }
    }
    """

  public let operationName: String = "FavoriteLocationsWeather"

  public var coordinates: [Coordinate]
  public var units: Units
  public var language: Language

  public init(coordinates: [Coordinate], units: Units, language: Language) {
    self.coordinates = coordinates
    self.units = units
    self.language = language
  }

  public var variables: GraphQLMap? {
    return ["coordinates": coordinates, "units": units, "language": language]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("bulkWeatherByCoordinates", arguments: ["coordinates": GraphQLVariable("coordinates"), "units": GraphQLVariable("units"), "language": GraphQLVariable("language")], type: .nonNull(.list(.object(BulkWeatherByCoordinate.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(bulkWeatherByCoordinates: [BulkWeatherByCoordinate?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "bulkWeatherByCoordinates": bulkWeatherByCoordinates.map { (value: BulkWeatherByCoordinate?) -> ResultMap? in value.flatMap { (value: BulkWeatherByCoordinate) -> ResultMap in value.resultMap } }])
    }

    /// Get weather information for multiple weather stations by list of coordinates.
    public var bulkWeatherByCoordinates: [BulkWeatherByCoordinate?] {
      get {
        return (resultMap["bulkWeatherByCoordinates"] as! [ResultMap?]).map { (value: ResultMap?) -> BulkWeatherByCoordinate? in value.flatMap { (value: ResultMap) -> BulkWeatherByCoordinate in BulkWeatherByCoordinate(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: BulkWeatherByCoordinate?) -> ResultMap? in value.flatMap { (value: BulkWeatherByCoordinate) -> ResultMap in value.resultMap } }, forKey: "bulkWeatherByCoordinates")
      }
    }

    public struct BulkWeatherByCoordinate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WeatherReport"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("currentConditions", type: .object(CurrentCondition.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(currentConditions: CurrentCondition? = nil) {
        self.init(unsafeResultMap: ["__typename": "WeatherReport", "currentConditions": currentConditions.flatMap { (value: CurrentCondition) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var currentConditions: CurrentCondition? {
        get {
          return (resultMap["currentConditions"] as? ResultMap).flatMap { CurrentCondition(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "currentConditions")
        }
      }

      public struct CurrentCondition: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CurrentConditions"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("temperature", type: .scalar(Double.self)),
          GraphQLField("iconCode", type: .scalar(Int.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(temperature: Double? = nil, iconCode: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "CurrentConditions", "temperature": temperature, "iconCode": iconCode])
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

        public var iconCode: Int? {
          get {
            return resultMap["iconCode"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "iconCode")
          }
        }
      }
    }
  }
}

public final class WeatherQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Weather($latitude: Float!, $longitude: Float!, $units: Units!, $language: Language!) {
      weatherByCoordinate(latitude: $latitude, longitude: $longitude, units: $units, language: $language) {
        __typename
        location {
          __typename
          weatherFor
          country
          province
          region
        }
        currentConditions {
          __typename
          time
          station {
            __typename
            name
            code
            latitude
            longitude
          }
          temperature
          humidity
          pressure
          windChill
          humidex
          wind {
            __typename
            direction
            speed
            gust
          }
          visibility
          dewPoint
          iconCode
          summary
        }
        todaySummary {
          __typename
          high
          low
        }
        units {
          __typename
          temperature
          pressure
          distance
          speed
        }
        warnings {
          __typename
          url
          events {
            __typename
            time
            summary
            type
            priority
          }
        }
        normals {
          __typename
          high
          low
        }
        dailyForecast {
          __typename
          time
          days {
            __typename
            when
            summary
            shortSummary
            iconCode
            precipProbability
            temperature
            humidex
            windChill
            winds {
              __typename
              direction
              speed
              gust
            }
          }
        }
        hourlyForecast {
          __typename
          time
          hours {
            __typename
            time
            summary
            iconCode
            precipProbability
            temperature
            humidex
            windChill
            wind {
              __typename
              direction
              speed
              gust
            }
          }
        }
        sun {
          __typename
          riseTime
          setTime
        }
        yesterday {
          __typename
          high
          low
          precip
        }
      }
    }
    """

  public let operationName: String = "Weather"

  public var latitude: Double
  public var longitude: Double
  public var units: Units
  public var language: Language

  public init(latitude: Double, longitude: Double, units: Units, language: Language) {
    self.latitude = latitude
    self.longitude = longitude
    self.units = units
    self.language = language
  }

  public var variables: GraphQLMap? {
    return ["latitude": latitude, "longitude": longitude, "units": units, "language": language]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("weatherByCoordinate", arguments: ["latitude": GraphQLVariable("latitude"), "longitude": GraphQLVariable("longitude"), "units": GraphQLVariable("units"), "language": GraphQLVariable("language")], type: .object(WeatherByCoordinate.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(weatherByCoordinate: WeatherByCoordinate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "weatherByCoordinate": weatherByCoordinate.flatMap { (value: WeatherByCoordinate) -> ResultMap in value.resultMap }])
    }

    /// Get weather information for a station closest to given coordinates.
    public var weatherByCoordinate: WeatherByCoordinate? {
      get {
        return (resultMap["weatherByCoordinate"] as? ResultMap).flatMap { WeatherByCoordinate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "weatherByCoordinate")
      }
    }

    public struct WeatherByCoordinate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WeatherReport"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.object(Location.selections))),
        GraphQLField("currentConditions", type: .object(CurrentCondition.selections)),
        GraphQLField("todaySummary", type: .object(TodaySummary.selections)),
        GraphQLField("units", type: .nonNull(.object(Unit.selections))),
        GraphQLField("warnings", type: .object(Warning.selections)),
        GraphQLField("normals", type: .object(Normal.selections)),
        GraphQLField("dailyForecast", type: .object(DailyForecast.selections)),
        GraphQLField("hourlyForecast", type: .object(HourlyForecast.selections)),
        GraphQLField("sun", type: .object(Sun.selections)),
        GraphQLField("yesterday", type: .object(Yesterday.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(location: Location, currentConditions: CurrentCondition? = nil, todaySummary: TodaySummary? = nil, units: Unit, warnings: Warning? = nil, normals: Normal? = nil, dailyForecast: DailyForecast? = nil, hourlyForecast: HourlyForecast? = nil, sun: Sun? = nil, yesterday: Yesterday? = nil) {
        self.init(unsafeResultMap: ["__typename": "WeatherReport", "location": location.resultMap, "currentConditions": currentConditions.flatMap { (value: CurrentCondition) -> ResultMap in value.resultMap }, "todaySummary": todaySummary.flatMap { (value: TodaySummary) -> ResultMap in value.resultMap }, "units": units.resultMap, "warnings": warnings.flatMap { (value: Warning) -> ResultMap in value.resultMap }, "normals": normals.flatMap { (value: Normal) -> ResultMap in value.resultMap }, "dailyForecast": dailyForecast.flatMap { (value: DailyForecast) -> ResultMap in value.resultMap }, "hourlyForecast": hourlyForecast.flatMap { (value: HourlyForecast) -> ResultMap in value.resultMap }, "sun": sun.flatMap { (value: Sun) -> ResultMap in value.resultMap }, "yesterday": yesterday.flatMap { (value: Yesterday) -> ResultMap in value.resultMap }])
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

      public var currentConditions: CurrentCondition? {
        get {
          return (resultMap["currentConditions"] as? ResultMap).flatMap { CurrentCondition(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "currentConditions")
        }
      }

      public var todaySummary: TodaySummary? {
        get {
          return (resultMap["todaySummary"] as? ResultMap).flatMap { TodaySummary(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "todaySummary")
        }
      }

      public var units: Unit {
        get {
          return Unit(unsafeResultMap: resultMap["units"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "units")
        }
      }

      public var warnings: Warning? {
        get {
          return (resultMap["warnings"] as? ResultMap).flatMap { Warning(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "warnings")
        }
      }

      public var normals: Normal? {
        get {
          return (resultMap["normals"] as? ResultMap).flatMap { Normal(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "normals")
        }
      }

      public var dailyForecast: DailyForecast? {
        get {
          return (resultMap["dailyForecast"] as? ResultMap).flatMap { DailyForecast(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "dailyForecast")
        }
      }

      public var hourlyForecast: HourlyForecast? {
        get {
          return (resultMap["hourlyForecast"] as? ResultMap).flatMap { HourlyForecast(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "hourlyForecast")
        }
      }

      public var sun: Sun? {
        get {
          return (resultMap["sun"] as? ResultMap).flatMap { Sun(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "sun")
        }
      }

      public var yesterday: Yesterday? {
        get {
          return (resultMap["yesterday"] as? ResultMap).flatMap { Yesterday(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "yesterday")
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("weatherFor", type: .nonNull(.scalar(String.self))),
          GraphQLField("country", type: .nonNull(.scalar(String.self))),
          GraphQLField("province", type: .nonNull(.scalar(String.self))),
          GraphQLField("region", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(weatherFor: String, country: String, province: String, region: String) {
          self.init(unsafeResultMap: ["__typename": "Location", "weatherFor": weatherFor, "country": country, "province": province, "region": region])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var weatherFor: String {
          get {
            return resultMap["weatherFor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "weatherFor")
          }
        }

        public var country: String {
          get {
            return resultMap["country"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "country")
          }
        }

        public var province: String {
          get {
            return resultMap["province"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "province")
          }
        }

        public var region: String {
          get {
            return resultMap["region"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "region")
          }
        }
      }

      public struct CurrentCondition: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CurrentConditions"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("time", type: .nonNull(.scalar(Int.self))),
          GraphQLField("station", type: .nonNull(.object(Station.selections))),
          GraphQLField("temperature", type: .scalar(Double.self)),
          GraphQLField("humidity", type: .scalar(Int.self)),
          GraphQLField("pressure", type: .scalar(Double.self)),
          GraphQLField("windChill", type: .scalar(Int.self)),
          GraphQLField("humidex", type: .scalar(Int.self)),
          GraphQLField("wind", type: .object(Wind.selections)),
          GraphQLField("visibility", type: .scalar(Double.self)),
          GraphQLField("dewPoint", type: .scalar(Double.self)),
          GraphQLField("iconCode", type: .scalar(Int.self)),
          GraphQLField("summary", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(time: Int, station: Station, temperature: Double? = nil, humidity: Int? = nil, pressure: Double? = nil, windChill: Int? = nil, humidex: Int? = nil, wind: Wind? = nil, visibility: Double? = nil, dewPoint: Double? = nil, iconCode: Int? = nil, summary: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "CurrentConditions", "time": time, "station": station.resultMap, "temperature": temperature, "humidity": humidity, "pressure": pressure, "windChill": windChill, "humidex": humidex, "wind": wind.flatMap { (value: Wind) -> ResultMap in value.resultMap }, "visibility": visibility, "dewPoint": dewPoint, "iconCode": iconCode, "summary": summary])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var time: Int {
          get {
            return resultMap["time"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "time")
          }
        }

        public var station: Station {
          get {
            return Station(unsafeResultMap: resultMap["station"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "station")
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

        public var humidity: Int? {
          get {
            return resultMap["humidity"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "humidity")
          }
        }

        public var pressure: Double? {
          get {
            return resultMap["pressure"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "pressure")
          }
        }

        public var windChill: Int? {
          get {
            return resultMap["windChill"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "windChill")
          }
        }

        public var humidex: Int? {
          get {
            return resultMap["humidex"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "humidex")
          }
        }

        public var wind: Wind? {
          get {
            return (resultMap["wind"] as? ResultMap).flatMap { Wind(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "wind")
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

        public var iconCode: Int? {
          get {
            return resultMap["iconCode"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "iconCode")
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

        public struct Station: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Station"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .nonNull(.scalar(String.self))),
            GraphQLField("latitude", type: .nonNull(.scalar(String.self))),
            GraphQLField("longitude", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, code: String, latitude: String, longitude: String) {
            self.init(unsafeResultMap: ["__typename": "Station", "name": name, "code": code, "latitude": latitude, "longitude": longitude])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var code: String {
            get {
              return resultMap["code"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "code")
            }
          }

          public var latitude: String {
            get {
              return resultMap["latitude"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "latitude")
            }
          }

          public var longitude: String {
            get {
              return resultMap["longitude"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "longitude")
            }
          }
        }

        public struct Wind: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Wind"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("direction", type: .scalar(String.self)),
            GraphQLField("speed", type: .scalar(String.self)),
            GraphQLField("gust", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(direction: String? = nil, speed: String? = nil, gust: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Wind", "direction": direction, "speed": speed, "gust": gust])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          public var speed: String? {
            get {
              return resultMap["speed"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speed")
            }
          }

          public var gust: Int? {
            get {
              return resultMap["gust"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "gust")
            }
          }
        }
      }

      public struct TodaySummary: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TodaySummary"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("high", type: .scalar(Double.self)),
          GraphQLField("low", type: .scalar(Double.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(high: Double? = nil, low: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "TodaySummary", "high": high, "low": low])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var high: Double? {
          get {
            return resultMap["high"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "high")
          }
        }

        public var low: Double? {
          get {
            return resultMap["low"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "low")
          }
        }
      }

      public struct Unit: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ResponseUnits"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("temperature", type: .nonNull(.scalar(String.self))),
          GraphQLField("pressure", type: .nonNull(.scalar(String.self))),
          GraphQLField("distance", type: .nonNull(.scalar(String.self))),
          GraphQLField("speed", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(temperature: String, pressure: String, distance: String, speed: String) {
          self.init(unsafeResultMap: ["__typename": "ResponseUnits", "temperature": temperature, "pressure": pressure, "distance": distance, "speed": speed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var temperature: String {
          get {
            return resultMap["temperature"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "temperature")
          }
        }

        public var pressure: String {
          get {
            return resultMap["pressure"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "pressure")
          }
        }

        public var distance: String {
          get {
            return resultMap["distance"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "distance")
          }
        }

        public var speed: String {
          get {
            return resultMap["speed"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speed")
          }
        }
      }

      public struct Warning: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Warnings"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("url", type: .nonNull(.scalar(String.self))),
          GraphQLField("events", type: .nonNull(.list(.nonNull(.object(Event.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(url: String, events: [Event]) {
          self.init(unsafeResultMap: ["__typename": "Warnings", "url": url, "events": events.map { (value: Event) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var events: [Event] {
          get {
            return (resultMap["events"] as! [ResultMap]).map { (value: ResultMap) -> Event in Event(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Event) -> ResultMap in value.resultMap }, forKey: "events")
          }
        }

        public struct Event: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Event"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("time", type: .nonNull(.scalar(Int.self))),
            GraphQLField("summary", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .nonNull(.scalar(WarningType.self))),
            GraphQLField("priority", type: .nonNull(.scalar(WarningPriority.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(time: Int, summary: String, type: WarningType, priority: WarningPriority) {
            self.init(unsafeResultMap: ["__typename": "Event", "time": time, "summary": summary, "type": type, "priority": priority])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var time: Int {
            get {
              return resultMap["time"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "time")
            }
          }

          public var summary: String {
            get {
              return resultMap["summary"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "summary")
            }
          }

          public var type: WarningType {
            get {
              return resultMap["type"]! as! WarningType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var priority: WarningPriority {
            get {
              return resultMap["priority"]! as! WarningPriority
            }
            set {
              resultMap.updateValue(newValue, forKey: "priority")
            }
          }
        }
      }

      public struct Normal: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Normals"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("high", type: .scalar(Int.self)),
          GraphQLField("low", type: .scalar(Int.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(high: Int? = nil, low: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Normals", "high": high, "low": low])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var high: Int? {
          get {
            return resultMap["high"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "high")
          }
        }

        public var low: Int? {
          get {
            return resultMap["low"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "low")
          }
        }
      }

      public struct DailyForecast: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DailyForecast"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("time", type: .scalar(Int.self)),
          GraphQLField("days", type: .list(.nonNull(.object(Day.selections)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(time: Int? = nil, days: [Day]? = nil) {
          self.init(unsafeResultMap: ["__typename": "DailyForecast", "time": time, "days": days.flatMap { (value: [Day]) -> [ResultMap] in value.map { (value: Day) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var time: Int? {
          get {
            return resultMap["time"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "time")
          }
        }

        public var days: [Day]? {
          get {
            return (resultMap["days"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Day] in value.map { (value: ResultMap) -> Day in Day(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Day]) -> [ResultMap] in value.map { (value: Day) -> ResultMap in value.resultMap } }, forKey: "days")
          }
        }

        public struct Day: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Day"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("when", type: .nonNull(.scalar(String.self))),
            GraphQLField("summary", type: .nonNull(.scalar(String.self))),
            GraphQLField("shortSummary", type: .nonNull(.scalar(String.self))),
            GraphQLField("iconCode", type: .nonNull(.scalar(Int.self))),
            GraphQLField("precipProbability", type: .scalar(Int.self)),
            GraphQLField("temperature", type: .nonNull(.scalar(Double.self))),
            GraphQLField("humidex", type: .scalar(Double.self)),
            GraphQLField("windChill", type: .scalar(Double.self)),
            GraphQLField("winds", type: .nonNull(.list(.nonNull(.object(Wind.selections))))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(when: String, summary: String, shortSummary: String, iconCode: Int, precipProbability: Int? = nil, temperature: Double, humidex: Double? = nil, windChill: Double? = nil, winds: [Wind]) {
            self.init(unsafeResultMap: ["__typename": "Day", "when": when, "summary": summary, "shortSummary": shortSummary, "iconCode": iconCode, "precipProbability": precipProbability, "temperature": temperature, "humidex": humidex, "windChill": windChill, "winds": winds.map { (value: Wind) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var when: String {
            get {
              return resultMap["when"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "when")
            }
          }

          public var summary: String {
            get {
              return resultMap["summary"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "summary")
            }
          }

          public var shortSummary: String {
            get {
              return resultMap["shortSummary"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "shortSummary")
            }
          }

          public var iconCode: Int {
            get {
              return resultMap["iconCode"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "iconCode")
            }
          }

          public var precipProbability: Int? {
            get {
              return resultMap["precipProbability"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "precipProbability")
            }
          }

          public var temperature: Double {
            get {
              return resultMap["temperature"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "temperature")
            }
          }

          public var humidex: Double? {
            get {
              return resultMap["humidex"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "humidex")
            }
          }

          public var windChill: Double? {
            get {
              return resultMap["windChill"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "windChill")
            }
          }

          public var winds: [Wind] {
            get {
              return (resultMap["winds"] as! [ResultMap]).map { (value: ResultMap) -> Wind in Wind(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Wind) -> ResultMap in value.resultMap }, forKey: "winds")
            }
          }

          public struct Wind: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Wind"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("direction", type: .scalar(String.self)),
              GraphQLField("speed", type: .scalar(String.self)),
              GraphQLField("gust", type: .scalar(Int.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(direction: String? = nil, speed: String? = nil, gust: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "Wind", "direction": direction, "speed": speed, "gust": gust])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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

            public var speed: String? {
              get {
                return resultMap["speed"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "speed")
              }
            }

            public var gust: Int? {
              get {
                return resultMap["gust"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "gust")
              }
            }
          }
        }
      }

      public struct HourlyForecast: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["HourlyForecast"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("time", type: .nonNull(.scalar(Int.self))),
          GraphQLField("hours", type: .list(.nonNull(.object(Hour.selections)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(time: Int, hours: [Hour]? = nil) {
          self.init(unsafeResultMap: ["__typename": "HourlyForecast", "time": time, "hours": hours.flatMap { (value: [Hour]) -> [ResultMap] in value.map { (value: Hour) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var time: Int {
          get {
            return resultMap["time"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "time")
          }
        }

        public var hours: [Hour]? {
          get {
            return (resultMap["hours"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Hour] in value.map { (value: ResultMap) -> Hour in Hour(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Hour]) -> [ResultMap] in value.map { (value: Hour) -> ResultMap in value.resultMap } }, forKey: "hours")
          }
        }

        public struct Hour: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Hour"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("time", type: .nonNull(.scalar(Int.self))),
            GraphQLField("summary", type: .nonNull(.scalar(String.self))),
            GraphQLField("iconCode", type: .nonNull(.scalar(Int.self))),
            GraphQLField("precipProbability", type: .nonNull(.scalar(String.self))),
            GraphQLField("temperature", type: .nonNull(.scalar(Double.self))),
            GraphQLField("humidex", type: .scalar(Double.self)),
            GraphQLField("windChill", type: .scalar(Double.self)),
            GraphQLField("wind", type: .object(Wind.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(time: Int, summary: String, iconCode: Int, precipProbability: String, temperature: Double, humidex: Double? = nil, windChill: Double? = nil, wind: Wind? = nil) {
            self.init(unsafeResultMap: ["__typename": "Hour", "time": time, "summary": summary, "iconCode": iconCode, "precipProbability": precipProbability, "temperature": temperature, "humidex": humidex, "windChill": windChill, "wind": wind.flatMap { (value: Wind) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var time: Int {
            get {
              return resultMap["time"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "time")
            }
          }

          public var summary: String {
            get {
              return resultMap["summary"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "summary")
            }
          }

          public var iconCode: Int {
            get {
              return resultMap["iconCode"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "iconCode")
            }
          }

          public var precipProbability: String {
            get {
              return resultMap["precipProbability"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "precipProbability")
            }
          }

          public var temperature: Double {
            get {
              return resultMap["temperature"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "temperature")
            }
          }

          public var humidex: Double? {
            get {
              return resultMap["humidex"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "humidex")
            }
          }

          public var windChill: Double? {
            get {
              return resultMap["windChill"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "windChill")
            }
          }

          public var wind: Wind? {
            get {
              return (resultMap["wind"] as? ResultMap).flatMap { Wind(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "wind")
            }
          }

          public struct Wind: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Wind"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("direction", type: .scalar(String.self)),
              GraphQLField("speed", type: .scalar(String.self)),
              GraphQLField("gust", type: .scalar(Int.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(direction: String? = nil, speed: String? = nil, gust: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "Wind", "direction": direction, "speed": speed, "gust": gust])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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

            public var speed: String? {
              get {
                return resultMap["speed"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "speed")
              }
            }

            public var gust: Int? {
              get {
                return resultMap["gust"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "gust")
              }
            }
          }
        }
      }

      public struct Sun: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Sun"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("riseTime", type: .nonNull(.scalar(Int.self))),
          GraphQLField("setTime", type: .nonNull(.scalar(Int.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(riseTime: Int, setTime: Int) {
          self.init(unsafeResultMap: ["__typename": "Sun", "riseTime": riseTime, "setTime": setTime])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var riseTime: Int {
          get {
            return resultMap["riseTime"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "riseTime")
          }
        }

        public var setTime: Int {
          get {
            return resultMap["setTime"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "setTime")
          }
        }
      }

      public struct Yesterday: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Yesterday"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("high", type: .scalar(Double.self)),
          GraphQLField("low", type: .scalar(Double.self)),
          GraphQLField("precip", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(high: Double? = nil, low: Double? = nil, precip: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Yesterday", "high": high, "low": low, "precip": precip])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var high: Double? {
          get {
            return resultMap["high"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "high")
          }
        }

        public var low: Double? {
          get {
            return resultMap["low"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "low")
          }
        }

        public var precip: String? {
          get {
            return resultMap["precip"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "precip")
          }
        }
      }
    }
  }
}
