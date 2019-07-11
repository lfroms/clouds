//  This file was automatically generated and should not be edited.

import Apollo

/// A two or three character province code.
public enum Region: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case ab
  case bc
  case hef
  case mb
  case nb
  case nl
  case ns
  case nt
  case nu
  case on
  case pe
  case qc
  case sk
  case yt
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "AB": self = .ab
      case "BC": self = .bc
      case "HEF": self = .hef
      case "MB": self = .mb
      case "NB": self = .nb
      case "NL": self = .nl
      case "NS": self = .ns
      case "NT": self = .nt
      case "NU": self = .nu
      case "ON": self = .on
      case "PE": self = .pe
      case "QC": self = .qc
      case "SK": self = .sk
      case "YT": self = .yt
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .ab: return "AB"
      case .bc: return "BC"
      case .hef: return "HEF"
      case .mb: return "MB"
      case .nb: return "NB"
      case .nl: return "NL"
      case .ns: return "NS"
      case .nt: return "NT"
      case .nu: return "NU"
      case .on: return "ON"
      case .pe: return "PE"
      case .qc: return "QC"
      case .sk: return "SK"
      case .yt: return "YT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Region, rhs: Region) -> Bool {
    switch (lhs, rhs) {
      case (.ab, .ab): return true
      case (.bc, .bc): return true
      case (.hef, .hef): return true
      case (.mb, .mb): return true
      case (.nb, .nb): return true
      case (.nl, .nl): return true
      case (.ns, .ns): return true
      case (.nt, .nt): return true
      case (.nu, .nu): return true
      case (.on, .on): return true
      case (.pe, .pe): return true
      case (.qc, .qc): return true
      case (.sk, .sk): return true
      case (.yt, .yt): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public enum WarningPriority: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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
}

public enum WarningType: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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
}

public final class WeatherQuery: GraphQLQuery {
  public let operationDefinition =
    "query Weather($region: Region!, $code: Int!) {\n  weather(region: $region, code: $code) {\n    __typename\n    location {\n      __typename\n      name {\n        __typename\n        value\n      }\n    }\n    currentConditions {\n      __typename\n      dateTime(zone: \"UTC\") {\n        __typename\n        timeStamp\n      }\n      station {\n        __typename\n        value\n      }\n      temperature {\n        __typename\n        value\n      }\n      relativeHumidity {\n        __typename\n        value\n        units\n      }\n      pressure {\n        __typename\n        value\n        units\n      }\n      windChill {\n        __typename\n        value\n      }\n      humidex {\n        __typename\n        value\n      }\n      wind {\n        __typename\n        direction\n        speed {\n          __typename\n          value\n          units\n        }\n        gust {\n          __typename\n          value\n          units\n        }\n      }\n      visibility {\n        __typename\n        value\n        units\n      }\n      dewpoint {\n        __typename\n        value\n      }\n      iconCode {\n        __typename\n        value\n      }\n      condition\n    }\n    warnings {\n      __typename\n      url\n      events {\n        __typename\n        dateTime(zone: \"UTC\") {\n          __typename\n          timeStamp\n        }\n        priority\n        description\n        type\n      }\n    }\n    forecastGroup {\n      __typename\n      dateTime(zone: \"UTC\") {\n        __typename\n        timeStamp\n      }\n      regionalNormals {\n        __typename\n        temperature {\n          __typename\n          value\n          class\n        }\n      }\n      forecast {\n        __typename\n        abbreviatedForecast {\n          __typename\n          textSummary\n          iconCode {\n            __typename\n            value\n          }\n          pop {\n            __typename\n            value\n          }\n        }\n        period {\n          __typename\n          textForecastName\n        }\n        temperatures {\n          __typename\n          temperature {\n            __typename\n            value\n          }\n        }\n      }\n    }\n    hourlyForecastGroup {\n      __typename\n      hourlyForecast {\n        __typename\n        dateTimeUTC\n        temperature {\n          __typename\n          value\n          units\n        }\n        wind {\n          __typename\n          speed {\n            __typename\n            value\n            units\n          }\n        }\n        iconCode {\n          __typename\n          value\n        }\n        lop {\n          __typename\n          value\n        }\n      }\n    }\n    riseSet {\n      __typename\n      dateTime(zone: \"UTC\") {\n        __typename\n        timeStamp\n        name\n      }\n    }\n    yesterdayConditions {\n      __typename\n      temperature {\n        __typename\n        value\n        class\n      }\n      precip {\n        __typename\n        value\n        units\n      }\n    }\n  }\n}"

  public var region: Region
  public var code: Int

  public init(region: Region, code: Int) {
    self.region = region
    self.code = code
  }

  public var variables: GraphQLMap? {
    return ["region": region, "code": code]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("weather", arguments: ["region": GraphQLVariable("region"), "code": GraphQLVariable("code")], type: .object(Weather.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(weather: Weather? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "weather": weather.flatMap { (value: Weather) -> ResultMap in value.resultMap }])
    }

    /// Get weather information for a given station.
    public var weather: Weather? {
      get {
        return (resultMap["weather"] as? ResultMap).flatMap { Weather(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "weather")
      }
    }

    public struct Weather: GraphQLSelectionSet {
      public static let possibleTypes = ["SiteData"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.object(Location.selections))),
        GraphQLField("currentConditions", type: .nonNull(.object(CurrentCondition.selections))),
        GraphQLField("warnings", type: .nonNull(.object(Warning.selections))),
        GraphQLField("forecastGroup", type: .nonNull(.object(ForecastGroup.selections))),
        GraphQLField("hourlyForecastGroup", type: .object(HourlyForecastGroup.selections)),
        GraphQLField("riseSet", type: .nonNull(.object(RiseSet.selections))),
        GraphQLField("yesterdayConditions", type: .nonNull(.object(YesterdayCondition.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(location: Location, currentConditions: CurrentCondition, warnings: Warning, forecastGroup: ForecastGroup, hourlyForecastGroup: HourlyForecastGroup? = nil, riseSet: RiseSet, yesterdayConditions: YesterdayCondition) {
        self.init(unsafeResultMap: ["__typename": "SiteData", "location": location.resultMap, "currentConditions": currentConditions.resultMap, "warnings": warnings.resultMap, "forecastGroup": forecastGroup.resultMap, "hourlyForecastGroup": hourlyForecastGroup.flatMap { (value: HourlyForecastGroup) -> ResultMap in value.resultMap }, "riseSet": riseSet.resultMap, "yesterdayConditions": yesterdayConditions.resultMap])
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

      public var currentConditions: CurrentCondition {
        get {
          return CurrentCondition(unsafeResultMap: resultMap["currentConditions"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "currentConditions")
        }
      }

      public var warnings: Warning {
        get {
          return Warning(unsafeResultMap: resultMap["warnings"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "warnings")
        }
      }

      public var forecastGroup: ForecastGroup {
        get {
          return ForecastGroup(unsafeResultMap: resultMap["forecastGroup"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "forecastGroup")
        }
      }

      public var hourlyForecastGroup: HourlyForecastGroup? {
        get {
          return (resultMap["hourlyForecastGroup"] as? ResultMap).flatMap { HourlyForecastGroup(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "hourlyForecastGroup")
        }
      }

      public var riseSet: RiseSet {
        get {
          return RiseSet(unsafeResultMap: resultMap["riseSet"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "riseSet")
        }
      }

      public var yesterdayConditions: YesterdayCondition {
        get {
          return YesterdayCondition(unsafeResultMap: resultMap["yesterdayConditions"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "yesterdayConditions")
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.object(Name.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: Name) {
          self.init(unsafeResultMap: ["__typename": "Location", "name": name.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: Name {
          get {
            return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "name")
          }
        }

        public struct Name: GraphQLSelectionSet {
          public static let possibleTypes = ["Name"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String) {
            self.init(unsafeResultMap: ["__typename": "Name", "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String {
            get {
              return resultMap["value"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }
      }

      public struct CurrentCondition: GraphQLSelectionSet {
        public static let possibleTypes = ["CurrentConditions"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("dateTime", arguments: ["zone": "UTC"], type: .object(DateTime.selections)),
          GraphQLField("station", type: .object(Station.selections)),
          GraphQLField("temperature", type: .object(Temperature.selections)),
          GraphQLField("relativeHumidity", type: .object(RelativeHumidity.selections)),
          GraphQLField("pressure", type: .object(Pressure.selections)),
          GraphQLField("windChill", type: .object(WindChill.selections)),
          GraphQLField("humidex", type: .object(Humidex.selections)),
          GraphQLField("wind", type: .object(Wind.selections)),
          GraphQLField("visibility", type: .object(Visibility.selections)),
          GraphQLField("dewpoint", type: .object(Dewpoint.selections)),
          GraphQLField("iconCode", type: .object(IconCode.selections)),
          GraphQLField("condition", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(dateTime: DateTime? = nil, station: Station? = nil, temperature: Temperature? = nil, relativeHumidity: RelativeHumidity? = nil, pressure: Pressure? = nil, windChill: WindChill? = nil, humidex: Humidex? = nil, wind: Wind? = nil, visibility: Visibility? = nil, dewpoint: Dewpoint? = nil, iconCode: IconCode? = nil, condition: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "CurrentConditions", "dateTime": dateTime.flatMap { (value: DateTime) -> ResultMap in value.resultMap }, "station": station.flatMap { (value: Station) -> ResultMap in value.resultMap }, "temperature": temperature.flatMap { (value: Temperature) -> ResultMap in value.resultMap }, "relativeHumidity": relativeHumidity.flatMap { (value: RelativeHumidity) -> ResultMap in value.resultMap }, "pressure": pressure.flatMap { (value: Pressure) -> ResultMap in value.resultMap }, "windChill": windChill.flatMap { (value: WindChill) -> ResultMap in value.resultMap }, "humidex": humidex.flatMap { (value: Humidex) -> ResultMap in value.resultMap }, "wind": wind.flatMap { (value: Wind) -> ResultMap in value.resultMap }, "visibility": visibility.flatMap { (value: Visibility) -> ResultMap in value.resultMap }, "dewpoint": dewpoint.flatMap { (value: Dewpoint) -> ResultMap in value.resultMap }, "iconCode": iconCode.flatMap { (value: IconCode) -> ResultMap in value.resultMap }, "condition": condition])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var dateTime: DateTime? {
          get {
            return (resultMap["dateTime"] as? ResultMap).flatMap { DateTime(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "dateTime")
          }
        }

        public var station: Station? {
          get {
            return (resultMap["station"] as? ResultMap).flatMap { Station(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "station")
          }
        }

        public var temperature: Temperature? {
          get {
            return (resultMap["temperature"] as? ResultMap).flatMap { Temperature(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "temperature")
          }
        }

        public var relativeHumidity: RelativeHumidity? {
          get {
            return (resultMap["relativeHumidity"] as? ResultMap).flatMap { RelativeHumidity(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "relativeHumidity")
          }
        }

        public var pressure: Pressure? {
          get {
            return (resultMap["pressure"] as? ResultMap).flatMap { Pressure(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pressure")
          }
        }

        public var windChill: WindChill? {
          get {
            return (resultMap["windChill"] as? ResultMap).flatMap { WindChill(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "windChill")
          }
        }

        public var humidex: Humidex? {
          get {
            return (resultMap["humidex"] as? ResultMap).flatMap { Humidex(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "humidex")
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

        public var visibility: Visibility? {
          get {
            return (resultMap["visibility"] as? ResultMap).flatMap { Visibility(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "visibility")
          }
        }

        public var dewpoint: Dewpoint? {
          get {
            return (resultMap["dewpoint"] as? ResultMap).flatMap { Dewpoint(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "dewpoint")
          }
        }

        public var iconCode: IconCode? {
          get {
            return (resultMap["iconCode"] as? ResultMap).flatMap { IconCode(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "iconCode")
          }
        }

        public var condition: String? {
          get {
            return resultMap["condition"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "condition")
          }
        }

        public struct DateTime: GraphQLSelectionSet {
          public static let possibleTypes = ["DateTime"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("timeStamp", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(timeStamp: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "DateTime", "timeStamp": timeStamp])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var timeStamp: String? {
            get {
              return resultMap["timeStamp"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "timeStamp")
            }
          }
        }

        public struct Station: GraphQLSelectionSet {
          public static let possibleTypes = ["Station"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Station", "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }

        public struct Temperature: GraphQLSelectionSet {
          public static let possibleTypes = ["Temperature"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Temperature", "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }

        public struct RelativeHumidity: GraphQLSelectionSet {
          public static let possibleTypes = ["RelativeHumidity"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("units", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String? = nil, units: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "RelativeHumidity", "value": value, "units": units])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          public var units: String? {
            get {
              return resultMap["units"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "units")
            }
          }
        }

        public struct Pressure: GraphQLSelectionSet {
          public static let possibleTypes = ["Pressure"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("units", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String? = nil, units: String) {
            self.init(unsafeResultMap: ["__typename": "Pressure", "value": value, "units": units])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          public var units: String {
            get {
              return resultMap["units"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "units")
            }
          }
        }

        public struct WindChill: GraphQLSelectionSet {
          public static let possibleTypes = ["CalculatedWindChill"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "CalculatedWindChill", "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }

        public struct Humidex: GraphQLSelectionSet {
          public static let possibleTypes = ["CalculatedHumidex"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "CalculatedHumidex", "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }

        public struct Wind: GraphQLSelectionSet {
          public static let possibleTypes = ["Wind"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("direction", type: .nonNull(.scalar(String.self))),
            GraphQLField("speed", type: .nonNull(.object(Speed.selections))),
            GraphQLField("gust", type: .nonNull(.object(Gust.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(direction: String, speed: Speed, gust: Gust) {
            self.init(unsafeResultMap: ["__typename": "Wind", "direction": direction, "speed": speed.resultMap, "gust": gust.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var direction: String {
            get {
              return resultMap["direction"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "direction")
            }
          }

          public var speed: Speed {
            get {
              return Speed(unsafeResultMap: resultMap["speed"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "speed")
            }
          }

          public var gust: Gust {
            get {
              return Gust(unsafeResultMap: resultMap["gust"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "gust")
            }
          }

          public struct Speed: GraphQLSelectionSet {
            public static let possibleTypes = ["Speed"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .scalar(String.self)),
              GraphQLField("units", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(value: String? = nil, units: String) {
              self.init(unsafeResultMap: ["__typename": "Speed", "value": value, "units": units])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var value: String? {
              get {
                return resultMap["value"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }

            public var units: String {
              get {
                return resultMap["units"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "units")
              }
            }
          }

          public struct Gust: GraphQLSelectionSet {
            public static let possibleTypes = ["Gust"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .scalar(String.self)),
              GraphQLField("units", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(value: String? = nil, units: String) {
              self.init(unsafeResultMap: ["__typename": "Gust", "value": value, "units": units])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var value: String? {
              get {
                return resultMap["value"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }

            public var units: String {
              get {
                return resultMap["units"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "units")
              }
            }
          }
        }

        public struct Visibility: GraphQLSelectionSet {
          public static let possibleTypes = ["Visibility"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("units", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String? = nil, units: String) {
            self.init(unsafeResultMap: ["__typename": "Visibility", "value": value, "units": units])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          public var units: String {
            get {
              return resultMap["units"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "units")
            }
          }
        }

        public struct Dewpoint: GraphQLSelectionSet {
          public static let possibleTypes = ["Temperature"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Temperature", "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }

        public struct IconCode: GraphQLSelectionSet {
          public static let possibleTypes = ["IconCode"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "IconCode", "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }
      }

      public struct Warning: GraphQLSelectionSet {
        public static let possibleTypes = ["Warnings"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("events", type: .list(.nonNull(.object(Event.selections)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(url: String? = nil, events: [Event]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Warnings", "url": url, "events": events.flatMap { (value: [Event]) -> [ResultMap] in value.map { (value: Event) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var url: String? {
          get {
            return resultMap["url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        public var events: [Event]? {
          get {
            return (resultMap["events"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Event] in value.map { (value: ResultMap) -> Event in Event(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Event]) -> [ResultMap] in value.map { (value: Event) -> ResultMap in value.resultMap } }, forKey: "events")
          }
        }

        public struct Event: GraphQLSelectionSet {
          public static let possibleTypes = ["WarningEvent"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("dateTime", arguments: ["zone": "UTC"], type: .object(DateTime.selections)),
            GraphQLField("priority", type: .nonNull(.scalar(WarningPriority.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .nonNull(.scalar(WarningType.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(dateTime: DateTime? = nil, priority: WarningPriority, description: String, type: WarningType) {
            self.init(unsafeResultMap: ["__typename": "WarningEvent", "dateTime": dateTime.flatMap { (value: DateTime) -> ResultMap in value.resultMap }, "priority": priority, "description": description, "type": type])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var dateTime: DateTime? {
            get {
              return (resultMap["dateTime"] as? ResultMap).flatMap { DateTime(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "dateTime")
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

          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
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

          public struct DateTime: GraphQLSelectionSet {
            public static let possibleTypes = ["DateTime"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("timeStamp", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(timeStamp: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "DateTime", "timeStamp": timeStamp])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var timeStamp: String? {
              get {
                return resultMap["timeStamp"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "timeStamp")
              }
            }
          }
        }
      }

      public struct ForecastGroup: GraphQLSelectionSet {
        public static let possibleTypes = ["ForecastGroup"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("dateTime", arguments: ["zone": "UTC"], type: .object(DateTime.selections)),
          GraphQLField("regionalNormals", type: .nonNull(.object(RegionalNormal.selections))),
          GraphQLField("forecast", type: .nonNull(.list(.nonNull(.object(Forecast.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(dateTime: DateTime? = nil, regionalNormals: RegionalNormal, forecast: [Forecast]) {
          self.init(unsafeResultMap: ["__typename": "ForecastGroup", "dateTime": dateTime.flatMap { (value: DateTime) -> ResultMap in value.resultMap }, "regionalNormals": regionalNormals.resultMap, "forecast": forecast.map { (value: Forecast) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var dateTime: DateTime? {
          get {
            return (resultMap["dateTime"] as? ResultMap).flatMap { DateTime(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "dateTime")
          }
        }

        public var regionalNormals: RegionalNormal {
          get {
            return RegionalNormal(unsafeResultMap: resultMap["regionalNormals"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "regionalNormals")
          }
        }

        public var forecast: [Forecast] {
          get {
            return (resultMap["forecast"] as! [ResultMap]).map { (value: ResultMap) -> Forecast in Forecast(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Forecast) -> ResultMap in value.resultMap }, forKey: "forecast")
          }
        }

        public struct DateTime: GraphQLSelectionSet {
          public static let possibleTypes = ["DateTime"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("timeStamp", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(timeStamp: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "DateTime", "timeStamp": timeStamp])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var timeStamp: String? {
            get {
              return resultMap["timeStamp"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "timeStamp")
            }
          }
        }

        public struct RegionalNormal: GraphQLSelectionSet {
          public static let possibleTypes = ["RegionalNormals"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("temperature", type: .nonNull(.list(.nonNull(.object(Temperature.selections))))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(temperature: [Temperature]) {
            self.init(unsafeResultMap: ["__typename": "RegionalNormals", "temperature": temperature.map { (value: Temperature) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var temperature: [Temperature] {
            get {
              return (resultMap["temperature"] as! [ResultMap]).map { (value: ResultMap) -> Temperature in Temperature(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Temperature) -> ResultMap in value.resultMap }, forKey: "temperature")
            }
          }

          public struct Temperature: GraphQLSelectionSet {
            public static let possibleTypes = ["Temperature"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .scalar(String.self)),
              GraphQLField("class", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(value: String? = nil, `class`: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Temperature", "value": value, "class": `class`])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var value: String? {
              get {
                return resultMap["value"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }

            public var `class`: String? {
              get {
                return resultMap["class"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "class")
              }
            }
          }
        }

        public struct Forecast: GraphQLSelectionSet {
          public static let possibleTypes = ["Forecast"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("abbreviatedForecast", type: .nonNull(.object(AbbreviatedForecast.selections))),
            GraphQLField("period", type: .nonNull(.object(Period.selections))),
            GraphQLField("temperatures", type: .nonNull(.object(Temperature.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(abbreviatedForecast: AbbreviatedForecast, period: Period, temperatures: Temperature) {
            self.init(unsafeResultMap: ["__typename": "Forecast", "abbreviatedForecast": abbreviatedForecast.resultMap, "period": period.resultMap, "temperatures": temperatures.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var abbreviatedForecast: AbbreviatedForecast {
            get {
              return AbbreviatedForecast(unsafeResultMap: resultMap["abbreviatedForecast"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "abbreviatedForecast")
            }
          }

          public var period: Period {
            get {
              return Period(unsafeResultMap: resultMap["period"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "period")
            }
          }

          public var temperatures: Temperature {
            get {
              return Temperature(unsafeResultMap: resultMap["temperatures"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "temperatures")
            }
          }

          public struct AbbreviatedForecast: GraphQLSelectionSet {
            public static let possibleTypes = ["AbbreviatedForecast"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("textSummary", type: .scalar(String.self)),
              GraphQLField("iconCode", type: .object(IconCode.selections)),
              GraphQLField("pop", type: .object(Pop.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(textSummary: String? = nil, iconCode: IconCode? = nil, pop: Pop? = nil) {
              self.init(unsafeResultMap: ["__typename": "AbbreviatedForecast", "textSummary": textSummary, "iconCode": iconCode.flatMap { (value: IconCode) -> ResultMap in value.resultMap }, "pop": pop.flatMap { (value: Pop) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var textSummary: String? {
              get {
                return resultMap["textSummary"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "textSummary")
              }
            }

            public var iconCode: IconCode? {
              get {
                return (resultMap["iconCode"] as? ResultMap).flatMap { IconCode(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "iconCode")
              }
            }

            public var pop: Pop? {
              get {
                return (resultMap["pop"] as? ResultMap).flatMap { Pop(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "pop")
              }
            }

            public struct IconCode: GraphQLSelectionSet {
              public static let possibleTypes = ["IconCode"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("value", type: .scalar(String.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(value: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "IconCode", "value": value])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var value: String? {
                get {
                  return resultMap["value"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "value")
                }
              }
            }

            public struct Pop: GraphQLSelectionSet {
              public static let possibleTypes = ["Pop"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("value", type: .scalar(String.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(value: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Pop", "value": value])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var value: String? {
                get {
                  return resultMap["value"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "value")
                }
              }
            }
          }

          public struct Period: GraphQLSelectionSet {
            public static let possibleTypes = ["Period"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("textForecastName", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(textForecastName: String) {
              self.init(unsafeResultMap: ["__typename": "Period", "textForecastName": textForecastName])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var textForecastName: String {
              get {
                return resultMap["textForecastName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "textForecastName")
              }
            }
          }

          public struct Temperature: GraphQLSelectionSet {
            public static let possibleTypes = ["Temperatures"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("temperature", type: .nonNull(.list(.nonNull(.object(Temperature.selections))))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(temperature: [Temperature]) {
              self.init(unsafeResultMap: ["__typename": "Temperatures", "temperature": temperature.map { (value: Temperature) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var temperature: [Temperature] {
              get {
                return (resultMap["temperature"] as! [ResultMap]).map { (value: ResultMap) -> Temperature in Temperature(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Temperature) -> ResultMap in value.resultMap }, forKey: "temperature")
              }
            }

            public struct Temperature: GraphQLSelectionSet {
              public static let possibleTypes = ["Temperature"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("value", type: .scalar(String.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(value: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Temperature", "value": value])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var value: String? {
                get {
                  return resultMap["value"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "value")
                }
              }
            }
          }
        }
      }

      public struct HourlyForecastGroup: GraphQLSelectionSet {
        public static let possibleTypes = ["HourlyForecastGroup"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("hourlyForecast", type: .nonNull(.list(.nonNull(.object(HourlyForecast.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hourlyForecast: [HourlyForecast]) {
          self.init(unsafeResultMap: ["__typename": "HourlyForecastGroup", "hourlyForecast": hourlyForecast.map { (value: HourlyForecast) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var hourlyForecast: [HourlyForecast] {
          get {
            return (resultMap["hourlyForecast"] as! [ResultMap]).map { (value: ResultMap) -> HourlyForecast in HourlyForecast(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: HourlyForecast) -> ResultMap in value.resultMap }, forKey: "hourlyForecast")
          }
        }

        public struct HourlyForecast: GraphQLSelectionSet {
          public static let possibleTypes = ["HourlyForecast"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("dateTimeUTC", type: .nonNull(.scalar(String.self))),
            GraphQLField("temperature", type: .nonNull(.object(Temperature.selections))),
            GraphQLField("wind", type: .nonNull(.object(Wind.selections))),
            GraphQLField("iconCode", type: .nonNull(.object(IconCode.selections))),
            GraphQLField("lop", type: .nonNull(.object(Lop.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(dateTimeUtc: String, temperature: Temperature, wind: Wind, iconCode: IconCode, lop: Lop) {
            self.init(unsafeResultMap: ["__typename": "HourlyForecast", "dateTimeUTC": dateTimeUtc, "temperature": temperature.resultMap, "wind": wind.resultMap, "iconCode": iconCode.resultMap, "lop": lop.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var dateTimeUtc: String {
            get {
              return resultMap["dateTimeUTC"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "dateTimeUTC")
            }
          }

          public var temperature: Temperature {
            get {
              return Temperature(unsafeResultMap: resultMap["temperature"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "temperature")
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

          public var iconCode: IconCode {
            get {
              return IconCode(unsafeResultMap: resultMap["iconCode"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "iconCode")
            }
          }

          public var lop: Lop {
            get {
              return Lop(unsafeResultMap: resultMap["lop"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "lop")
            }
          }

          public struct Temperature: GraphQLSelectionSet {
            public static let possibleTypes = ["Temperature"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .scalar(String.self)),
              GraphQLField("units", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(value: String? = nil, units: String) {
              self.init(unsafeResultMap: ["__typename": "Temperature", "value": value, "units": units])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var value: String? {
              get {
                return resultMap["value"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }

            public var units: String {
              get {
                return resultMap["units"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "units")
              }
            }
          }

          public struct Wind: GraphQLSelectionSet {
            public static let possibleTypes = ["WindHourly"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speed", type: .nonNull(.object(Speed.selections))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(speed: Speed) {
              self.init(unsafeResultMap: ["__typename": "WindHourly", "speed": speed.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var speed: Speed {
              get {
                return Speed(unsafeResultMap: resultMap["speed"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "speed")
              }
            }

            public struct Speed: GraphQLSelectionSet {
              public static let possibleTypes = ["Speed"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("value", type: .scalar(String.self)),
                GraphQLField("units", type: .nonNull(.scalar(String.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(value: String? = nil, units: String) {
                self.init(unsafeResultMap: ["__typename": "Speed", "value": value, "units": units])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var value: String? {
                get {
                  return resultMap["value"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "value")
                }
              }

              public var units: String {
                get {
                  return resultMap["units"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "units")
                }
              }
            }
          }

          public struct IconCode: GraphQLSelectionSet {
            public static let possibleTypes = ["IconCode"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(value: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "IconCode", "value": value])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var value: String? {
              get {
                return resultMap["value"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }
          }

          public struct Lop: GraphQLSelectionSet {
            public static let possibleTypes = ["Lop"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(value: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Lop", "value": value])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var value: String? {
              get {
                return resultMap["value"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }
          }
        }
      }

      public struct RiseSet: GraphQLSelectionSet {
        public static let possibleTypes = ["RiseSet"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("dateTime", arguments: ["zone": "UTC"], type: .list(.nonNull(.object(DateTime.selections)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(dateTime: [DateTime]? = nil) {
          self.init(unsafeResultMap: ["__typename": "RiseSet", "dateTime": dateTime.flatMap { (value: [DateTime]) -> [ResultMap] in value.map { (value: DateTime) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var dateTime: [DateTime]? {
          get {
            return (resultMap["dateTime"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [DateTime] in value.map { (value: ResultMap) -> DateTime in DateTime(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [DateTime]) -> [ResultMap] in value.map { (value: DateTime) -> ResultMap in value.resultMap } }, forKey: "dateTime")
          }
        }

        public struct DateTime: GraphQLSelectionSet {
          public static let possibleTypes = ["DateTime"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("timeStamp", type: .scalar(String.self)),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(timeStamp: String? = nil, name: String) {
            self.init(unsafeResultMap: ["__typename": "DateTime", "timeStamp": timeStamp, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var timeStamp: String? {
            get {
              return resultMap["timeStamp"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "timeStamp")
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
        }
      }

      public struct YesterdayCondition: GraphQLSelectionSet {
        public static let possibleTypes = ["YesterdayConditions"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("temperature", type: .nonNull(.list(.nonNull(.object(Temperature.selections))))),
          GraphQLField("precip", type: .nonNull(.list(.nonNull(.object(Precip.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(temperature: [Temperature], precip: [Precip]) {
          self.init(unsafeResultMap: ["__typename": "YesterdayConditions", "temperature": temperature.map { (value: Temperature) -> ResultMap in value.resultMap }, "precip": precip.map { (value: Precip) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var temperature: [Temperature] {
          get {
            return (resultMap["temperature"] as! [ResultMap]).map { (value: ResultMap) -> Temperature in Temperature(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Temperature) -> ResultMap in value.resultMap }, forKey: "temperature")
          }
        }

        public var precip: [Precip] {
          get {
            return (resultMap["precip"] as! [ResultMap]).map { (value: ResultMap) -> Precip in Precip(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Precip) -> ResultMap in value.resultMap }, forKey: "precip")
          }
        }

        public struct Temperature: GraphQLSelectionSet {
          public static let possibleTypes = ["Temperature"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("class", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String? = nil, `class`: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Temperature", "value": value, "class": `class`])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          public var `class`: String? {
            get {
              return resultMap["class"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "class")
            }
          }
        }

        public struct Precip: GraphQLSelectionSet {
          public static let possibleTypes = ["HistoricPrecipitation"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("units", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: String? = nil, units: String) {
            self.init(unsafeResultMap: ["__typename": "HistoricPrecipitation", "value": value, "units": units])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          public var units: String {
            get {
              return resultMap["units"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "units")
            }
          }
        }
      }
    }
  }
}

public final class SiteListQuery: GraphQLQuery {
  public let operationDefinition =
    "query SiteList {\n  sites {\n    __typename\n    code\n    name\n    province\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("sites", type: .list(.nonNull(.object(Site.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sites: [Site]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sites": sites.flatMap { (value: [Site]) -> [ResultMap] in value.map { (value: Site) -> ResultMap in value.resultMap } }])
    }

    /// Retrieve the entire site list or search by coordinates.
    public var sites: [Site]? {
      get {
        return (resultMap["sites"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Site] in value.map { (value: ResultMap) -> Site in Site(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Site]) -> [ResultMap] in value.map { (value: Site) -> ResultMap in value.resultMap } }, forKey: "sites")
      }
    }

    public struct Site: GraphQLSelectionSet {
      public static let possibleTypes = ["Site"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("code", type: .nonNull(.scalar(Int.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("province", type: .nonNull(.scalar(Region.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(code: Int, name: String, province: Region) {
        self.init(unsafeResultMap: ["__typename": "Site", "code": code, "name": name, "province": province])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var code: Int {
        get {
          return resultMap["code"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "code")
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

      public var province: Region {
        get {
          return resultMap["province"]! as! Region
        }
        set {
          resultMap.updateValue(newValue, forKey: "province")
        }
      }
    }
  }
}