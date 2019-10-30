//
//  ForecastView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
        ZStack {
            ShadowView(radius: 30, opacity: 0.08, color: .black, cornerRadius: 18)

            VStack(alignment: .leading, spacing: 14) {
                HStack(alignment: .firstTextBaseline, spacing: 5) {
                    Image(systemName: "cloud.sun.fill")
                    Text("25º")
                }
                .font(Font.system(size: 22).bold())

                Text("Lots of text that might even wrap depending on how much of it there is.")
                    .font(.footnote)
                    .fontWeight(.semibold)

                HStack(alignment: .center, spacing: 10) {
                    ForecastDetailView(symbol: "wind", text: "15 km/h")
                    ForecastDetailView(symbol: "umbrella.fill", text: "25%")
                }
            }
            .padding(16)
            .frame(width: 215)
            .background(Color.white.opacity(0.15))
            .cornerRadius(18)
        }
        .frame(width: 215)
        .foregroundColor(.white)
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BlackBackground()
            ForecastView()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
