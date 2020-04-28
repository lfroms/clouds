//
//  WMSResourceURL.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-04-17.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct WMSResourceURL {
    let host: String
    let path: String
    let version: String
    let request: String
    let format: String
    let transparent: Bool
    let layer: String
    let tiled: Bool
    let date: Date
    let coordinateReferenceSystem: String
    let width: Int
    let height: Int
    let boundingBoxTemplate: String

    var string: String? {
        guard let urlString = components.string else {
            return nil
        }

        return urlString + "&bbox=" + boundingBoxTemplate
    }

    private var components: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = "/\(path)"

        components.queryItems = [
            URLQueryItem(name: "service", value: "WMS"),
            URLQueryItem(name: "version", value: version),
            URLQueryItem(name: "request", value: request),
            URLQueryItem(name: "format", value: format),
            URLQueryItem(name: "transparent", value: String(transparent)),
            URLQueryItem(name: "layers", value: layer),
            URLQueryItem(name: "tiled", value: String(tiled)),
            URLQueryItem(name: "time", value: date.toISO()),
            URLQueryItem(name: "crs", value: coordinateReferenceSystem),
            URLQueryItem(name: "width", value: String(width)),
            URLQueryItem(name: "height", value: String(height)),
        ]

        return components
    }
}
