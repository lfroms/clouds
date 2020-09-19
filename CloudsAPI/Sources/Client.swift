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
        #if DEBUG
        private static let serverAddress = "https://nimbus-data-staging.herokuapp.com/graphql"
        #else
        private static let serverAddress = "https://nimbus-data.herokuapp.com/graphql"
        #endif

        private static let client = ApolloClient(url: URL(string: serverAddress)!)

        public init() {}

        public func fetch<Query: GraphQLQuery>(
            query: Query,
            cachePolicy: CachePolicy,
            resultHandler: GraphQLResultHandler<Query.Data>? = nil
        ) -> Cancellable {
            return Self.client.fetch(query: query, cachePolicy: cachePolicy, resultHandler: resultHandler)
        }

        public func perform<Mutation: GraphQLMutation>(
            mutation: Mutation,
            resultHandler: GraphQLResultHandler<Mutation.Data>? = nil
        ) -> Cancellable {
            return Self.client.perform(mutation: mutation, resultHandler: resultHandler)
        }
    }
}
