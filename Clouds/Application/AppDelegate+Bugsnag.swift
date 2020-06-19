//
//  AppDelegate+Bugsnag.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-05-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Bugsnag
import Foundation

extension AppDelegate {
    internal func configureBugsnag() {
        let configuration = BugsnagConfiguration()
        configuration.apiKey = "202b8ddb3f0943ad3c5dc0c842dc8ed7"

        #if DEBUG
        configuration.releaseStage = "development"
        #else
        configuration.releaseStage = "production"
        #endif

        guard !AppEnvironment.isUITesting else {
            return
        }

        Bugsnag.start(with: configuration)
    }
}
