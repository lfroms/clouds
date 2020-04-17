// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CoordinateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - latitude
  ///   - longitude
  public init(latitude: Double, longitude: Double) {
    graphQLMap = ["latitude": latitude, "longitude": longitude]
  }

  public var latitude: Double {
    get {
      return graphQLMap["latitude"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var longitude: Double {
    get {
      return graphQLMap["longitude"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }
}

public enum Language: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case english
  case french
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "english": self = .english
      case "french": self = .french
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .english: return "english"
      case .french: return "french"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Language, rhs: Language) -> Bool {
    switch (lhs, rhs) {
      case (.english, .english): return true
      case (.french, .french): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Language] {
    return [
      .english,
      .french,
    ]
  }
}

/// Type of weather alert.
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

/// The provider to be used to retrieve radar timestamps.
public enum RadarProvider: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case msc
  case rainviewer
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "msc": self = .msc
      case "rainviewer": self = .rainviewer
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .msc: return "msc"
      case .rainviewer: return "rainviewer"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: RadarProvider, rhs: RadarProvider) -> Bool {
    switch (lhs, rhs) {
      case (.msc, .msc): return true
      case (.rainviewer, .rainviewer): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [RadarProvider] {
    return [
      .msc,
      .rainviewer,
    ]
  }
}

public final class WeatherQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Weather($currentLocation: CoordinateInput, $activeLocation: CoordinateInput, $favoriteCoordinates: [CoordinateInput!]!, $language: Language!) {
      currentLocationWeather: weather(coordinate: $currentLocation, language: $language) {
        __typename
        currently {
          __typename
          temperature
          icon
        }
      }
      favoriteLocationWeather: bulkWeather(coordinates: $favoriteCoordinates, language: $language) {
        __typename
        currently {
          __typename
          temperature
          icon
        }
      }
      activeLocationWeather: weather(coordinate: $activeLocation, language: $language) {
        __typename
        location {
          __typename
          stationName
          distance
        }
        alerts {
          __typename
          title
          time
          type
          uri
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
          icon
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
          icon
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
            icon
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
            icon
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

  public var currentLocation: CoordinateInput?
  public var activeLocation: CoordinateInput?
  public var favoriteCoordinates: [CoordinateInput]
  public var language: Language

  public init(currentLocation: CoordinateInput? = nil, activeLocation: CoordinateInput? = nil, favoriteCoordinates: [CoordinateInput], language: Language) {
    self.currentLocation = currentLocation
    self.activeLocation = activeLocation
    self.favoriteCoordinates = favoriteCoordinates
    self.language = language
  }

  public var variables: GraphQLMap? {
    return ["currentLocation": currentLocation, "activeLocation": activeLocation, "favoriteCoordinates": favoriteCoordinates, "language": language]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("weather", alias: "currentLocationWeather", arguments: ["coordinate": GraphQLVariable("currentLocation"), "language": GraphQLVariable("language")], type: .object(CurrentLocationWeather.selections)),
      GraphQLField("bulkWeather", alias: "favoriteLocationWeather", arguments: ["coordinates": GraphQLVariable("favoriteCoordinates"), "language": GraphQLVariable("language")], type: .nonNull(.list(.object(FavoriteLocationWeather.selections)))),
      GraphQLField("weather", alias: "activeLocationWeather", arguments: ["coordinate": GraphQLVariable("activeLocation"), "language": GraphQLVariable("language")], type: .object(ActiveLocationWeather.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(currentLocationWeather: CurrentLocationWeather? = nil, favoriteLocationWeather: [FavoriteLocationWeather?], activeLocationWeather: ActiveLocationWeather? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "currentLocationWeather": currentLocationWeather.flatMap { (value: CurrentLocationWeather) -> ResultMap in value.resultMap }, "favoriteLocationWeather": favoriteLocationWeather.map { (value: FavoriteLocationWeather?) -> ResultMap? in value.flatMap { (value: FavoriteLocationWeather) -> ResultMap in value.resultMap } }, "activeLocationWeather": activeLocationWeather.flatMap { (value: ActiveLocationWeather) -> ResultMap in value.resultMap }])
    }

    /// Get weather information given a coordinate.
    public var currentLocationWeather: CurrentLocationWeather? {
      get {
        return (resultMap["currentLocationWeather"] as? ResultMap).flatMap { CurrentLocationWeather(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "currentLocationWeather")
      }
    }

    /// Get weather information given one or more coordinates.
    public var favoriteLocationWeather: [FavoriteLocationWeather?] {
      get {
        return (resultMap["favoriteLocationWeather"] as! [ResultMap?]).map { (value: ResultMap?) -> FavoriteLocationWeather? in value.flatMap { (value: ResultMap) -> FavoriteLocationWeather in FavoriteLocationWeather(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: FavoriteLocationWeather?) -> ResultMap? in value.flatMap { (value: FavoriteLocationWeather) -> ResultMap in value.resultMap } }, forKey: "favoriteLocationWeather")
      }
    }

    /// Get weather information given a coordinate.
    public var activeLocationWeather: ActiveLocationWeather? {
      get {
        return (resultMap["activeLocationWeather"] as? ResultMap).flatMap { ActiveLocationWeather(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "activeLocationWeather")
      }
    }

    public struct CurrentLocationWeather: GraphQLSelectionSet {
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
          GraphQLField("icon", type: .scalar(Int.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(temperature: Double? = nil, icon: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Currently", "temperature": temperature, "icon": icon])
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

        public var icon: Int? {
          get {
            return resultMap["icon"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "icon")
          }
        }
      }
    }

    public struct FavoriteLocationWeather: GraphQLSelectionSet {
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
          GraphQLField("icon", type: .scalar(Int.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(temperature: Double? = nil, icon: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Currently", "temperature": temperature, "icon": icon])
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

        public var icon: Int? {
          get {
            return resultMap["icon"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "icon")
          }
        }
      }
    }

    public struct ActiveLocationWeather: GraphQLSelectionSet {
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
          GraphQLField("distance", type: .nonNull(.scalar(Double.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(stationName: String? = nil, distance: Double) {
          self.init(unsafeResultMap: ["__typename": "Location", "stationName": stationName, "distance": distance])
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

        public var distance: Double {
          get {
            return resultMap["distance"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "distance")
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
          GraphQLField("uri", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String, time: Double, type: AlertType, uri: String) {
          self.init(unsafeResultMap: ["__typename": "Alert", "title": title, "time": time, "type": type, "uri": uri])
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

        public var uri: String {
          get {
            return resultMap["uri"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "uri")
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
          GraphQLField("icon", type: .scalar(Int.self)),
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

        public init(time: Double, summary: String? = nil, icon: Int? = nil, temperature: Double? = nil, humidity: Double? = nil, pressure: Pressure, feelsLike: FeelsLike, wind: Wind, visibility: Double? = nil, dewPoint: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "Currently", "time": time, "summary": summary, "icon": icon, "temperature": temperature, "humidity": humidity, "pressure": pressure.resultMap, "feelsLike": feelsLike.resultMap, "wind": wind.resultMap, "visibility": visibility, "dewPoint": dewPoint])
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

        public var icon: Int? {
          get {
            return resultMap["icon"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "icon")
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
          GraphQLField("icon", type: .scalar(Int.self)),
          GraphQLField("temperature", type: .scalar(Double.self)),
          GraphQLField("feelsLike", type: .nonNull(.object(FeelsLike.selections))),
          GraphQLField("precipProbability", type: .scalar(Double.self)),
          GraphQLField("wind", type: .nonNull(.object(Wind.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(time: Double, summary: String? = nil, icon: Int? = nil, temperature: Double? = nil, feelsLike: FeelsLike, precipProbability: Double? = nil, wind: Wind) {
          self.init(unsafeResultMap: ["__typename": "Hourly", "time": time, "summary": summary, "icon": icon, "temperature": temperature, "feelsLike": feelsLike.resultMap, "precipProbability": precipProbability, "wind": wind.resultMap])
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

        public var icon: Int? {
          get {
            return resultMap["icon"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "icon")
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
            GraphQLField("icon", type: .scalar(Int.self)),
            GraphQLField("temperature", type: .scalar(Double.self)),
            GraphQLField("precipProbability", type: .scalar(Double.self)),
            GraphQLField("wind", type: .nonNull(.object(Wind.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(summary: String? = nil, summaryClouds: String? = nil, icon: Int? = nil, temperature: Double? = nil, precipProbability: Double? = nil, wind: Wind) {
            self.init(unsafeResultMap: ["__typename": "HalfDayCondition", "summary": summary, "summaryClouds": summaryClouds, "icon": icon, "temperature": temperature, "precipProbability": precipProbability, "wind": wind.resultMap])
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

          public var icon: Int? {
            get {
              return resultMap["icon"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "icon")
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
            GraphQLField("icon", type: .scalar(Int.self)),
            GraphQLField("temperature", type: .scalar(Double.self)),
            GraphQLField("precipProbability", type: .scalar(Double.self)),
            GraphQLField("wind", type: .nonNull(.object(Wind.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(summary: String? = nil, summaryClouds: String? = nil, icon: Int? = nil, temperature: Double? = nil, precipProbability: Double? = nil, wind: Wind) {
            self.init(unsafeResultMap: ["__typename": "HalfDayCondition", "summary": summary, "summaryClouds": summaryClouds, "icon": icon, "temperature": temperature, "precipProbability": precipProbability, "wind": wind.resultMap])
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

          public var icon: Int? {
            get {
              return resultMap["icon"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "icon")
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

    /// Get radar timestamps given a provider.
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
