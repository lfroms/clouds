//
//  Client.swift
//  CloudsAPI
//
//  Created by Lukas Romsicki on 2020-09-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Apollo
import Foundation

public extension CloudsAPI {
    class Client {
        public static let shared = Client()

        #if DEBUG
        private let serverAddress = "https://nimbus-data-staging.herokuapp.com/graphql"
        #else
        private let serverAddress = "https://nimbus-data.herokuapp.com/graphql"
        #endif

        private let client: ApolloClient

        private init() {
            client = ApolloClient(url: URL(string: serverAddress)!)
        }

        public func fetchWeather(
            latitude: Double,
            longitude: Double,
            resultHandler: @escaping (Result<GraphQLResult<WeatherQuery.Data>, Error>) -> Void
        ) {
            let query = WeatherQuery(latitude: latitude, longitude: longitude)
            client.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely, resultHandler: resultHandler)
        }

        public func fetchWeatherLocationItem(
            latitude: Double,
            longitude: Double,
            resultHandler: @escaping (Result<GraphQLResult<WeatherLocationItemQuery.Data>, Error>) -> Void
        ) {
            let query = WeatherLocationItemQuery(latitude: latitude, longitude: longitude)
            client.fetch(query: query, cachePolicy: .returnCacheDataAndFetch, resultHandler: resultHandler)
        }

        public func fetchRadarTimestamps(
            provider: RadarProvider,
            resultHandler: @escaping (Result<GraphQLResult<RadarTimestampsQuery.Data>, Error>) -> Void

        ) {
            let query = RadarTimestampsQuery(provider: provider)
            client.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely, resultHandler: resultHandler)
        }
    }
}
