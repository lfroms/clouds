//
//  DynamicStubs+stubRandomWeatherResponse.swift
//  CloudsScreenshots
//
//  Created by Lukas Romsicki on 2020-06-18.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import Swifter

extension DynamicStubs {
    func stubRandomWeatherResponse() {
        let response: ((HttpRequest) -> HttpResponse) = { _ in
            let json = try? JSONSerialization.jsonObject(with: RandomWeatherFixtureJSON().jsonData!, options: .mutableContainers)
            return HttpResponse.ok(.json(json as AnyObject))
        }

        server.post["/graphql"] = response
    }
}
