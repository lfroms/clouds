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
              1588272000,
              1588272600,
              1588273200,
              1588273800,
              1588274400,
              1588275000,
              1588275600,
              1588276200,
              1588276800,
              1588277400,
              1588278000,
              1588278600,
              1588279200,
              1588279800,
              1588280400,
              1588281000,
              1588281600,
              1588282200
            ]
          }
        }
    """

    var jsonData: Data? {
        return jsonString.data(using: .utf8)
    }
}
