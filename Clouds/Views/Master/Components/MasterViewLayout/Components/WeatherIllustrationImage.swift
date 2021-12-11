//
//  WeatherIllustrationImage.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-19.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct WeatherIllustrationImage: View {
    var image: Image
    var useSmallSize: Bool

    var body: some View {
        Group {
            if useSmallSize {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 300)
                    .offset(y: Dimension.Global.padding)
            } else {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(y: Dimension.Global.padding)
            }
        }
    }
}

extension WeatherIllustrationImage: Equatable {}

struct WeatherIllustrationImage_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIllustrationImage(image: Image(""), useSmallSize: true)
    }
}
