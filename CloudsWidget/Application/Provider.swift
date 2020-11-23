//
//  Provider.swift
//  CloudsWidgetExtension
//
//  Created by Lukas Romsicki on 2020-11-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import CloudsAPI
import CoreLocation
import WidgetKit

struct Provider: TimelineProvider {
    public typealias Entry = WeatherEntry

    private let client = CloudsAPI.Client()
    private let widgetLocationManager = WidgetLocationManager()

    func placeholder(in context: Context) -> Entry {
        WeatherEntry(
            date: Date(),
            colorScheme: .empty,
            temperature: 21,
            description: "Partly Cloudy"
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        let entry = WeatherEntry(
            date: Date(),
            iconStyle: .partlyCloudy,
            colorScheme: .clearSky,
            temperature: 21,
            description: "Partly Cloudy"
        )

        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        widgetLocationManager.fetchLocation { location in
            guard let location = location else {
                let entry = WeatherEntry(date: Calendar.current.date(byAdding: .minute, value: 15, to: Date())!)

                completion(Timeline(entries: [entry], policy: .atEnd))

                return
            }

            createTimeline(location: location) { timeline in
                completion(timeline)
            }
        }
    }

    private func createTimeline(location: CLLocation, completion: @escaping (Timeline<Entry>) -> Void) {
        let query = CloudsAPI.WidgetWeatherQuery(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)

        _ = client.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    let entry = createEntryFromWeatherData(data)

                    let timeline = Timeline(entries: [entry], policy: .atEnd)
                    completion(timeline)
                }

            case .failure: break
            }
        }
    }

    private func createEntryFromWeatherData(_ data: CloudsAPI.WidgetWeatherQuery.Data) -> Entry {
        let icon = data.weather?.currently.icon

        let entry = WeatherEntry(
            date: Calendar.current.date(byAdding: .minute, value: 15, to: Date())!,
            iconStyle: icon?.style,
            colorScheme: icon?.colorScheme,
            temperature: data.weather?.currently.temperature,
            description: data.weather?.currently.summary
        )

        return entry
    }
}
