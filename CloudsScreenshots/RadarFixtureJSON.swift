//
//  RadarFixtureJSON.swift
//  CloudsScreenshots
//
//  Created by Lukas Romsicki on 2020-04-30.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct RadarFixtureJSON {
    let jsonString = """
        {
          "data": {
            "radarTimestamps": [
              1588281600,
              1588282200,
              1588282800,
              1588283400,
              1588284000,
              1588284600,
              1588285200,
              1588285800,
              1588286400,
              1588287000,
              1588287600,
              1588288200,
              1588288800,
              1588289400,
              1588290000,
              1588290600,
              1588291200,
              1588291800
            ]
          }
        }
    """

    var jsonData: Data? {
        return jsonString.data(using: .utf8)
    }
}
