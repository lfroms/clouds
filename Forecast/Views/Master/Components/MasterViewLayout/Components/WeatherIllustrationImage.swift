//
//  WeatherIllustrationImage.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-19.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeatherIllustrationImage: View {
    var image: String
    var shouldScale: Bool

    var body: some View {
        Group {
            if Dimension.System.deviceIsiPhone8 && shouldScale {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 300)
                    .offset(y: Dimension.Global.padding)

            } else {
                Image(image)
            }
        }
    }
}

extension WeatherIllustrationImage: Equatable {}

struct WeatherIllustrationImage_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIllustrationImage(image: "image-0", shouldScale: true)
    }
}