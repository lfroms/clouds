//
//  GraphQL.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Apollo
import Foundation

final class GraphQL {
    static let shared = GraphQL()

    #if DEBUG
    private let serverAddress = "https://nimbus-data-staging.herokuapp.com/graphql"
    #else
    private let serverAddress = "https://nimbus-data.herokuapp.com/graphql"
    #endif

    private var serverURL: URL? {
        if ProcessInfo.processInfo.arguments.contains("UI_TESTING") {
            return URL(string: "http://localhost:8080/graphql")
        } else {
            return URL(string: serverAddress)
        }
    }

    private(set) lazy var apollo = ApolloClient(url: serverURL!)
}
