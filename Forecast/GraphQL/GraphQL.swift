//
//  GraphQL.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Apollo
import Foundation

final class GraphQL {
    static let shared = GraphQL()

    private let serverAddress = "https://forecast-data.herokuapp.com/graphql"
    private(set) lazy var apollo = ApolloClient(url: URL(string: serverAddress)!)
}
