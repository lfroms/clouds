//
//  DynamicStubs.swift
//  CloudsScreenshots
//
//  Created by Lukas Romsicki on 2020-04-30.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import Swifter

class DynamicStubs {
    let server = HttpServer()

    func stubRequest(path: String, jsonData: Data) {
        guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) else {
            assertionFailure("Could not convert data to json")
            return
        }

        let response: ((HttpRequest) -> HttpResponse) = { _ in
            HttpResponse.ok(.json(json as AnyObject))
        }

        server.post[path] = response
    }

    func stubRandomWeatherResponse() {
        let response: ((HttpRequest) -> HttpResponse) = { _ in
            let json = try? JSONSerialization.jsonObject(with: RandomWeatherFixtureJSON().jsonData!, options: .mutableContainers)
            return HttpResponse.ok(.json(json as AnyObject))
        }

        server.post["/graphql"] = response
    }
}
