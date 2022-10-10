//
//  SunsetSheet.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2022-10-10.
//  Copyright © 2022 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SunsetSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("sunsetSheetDismissed") private var sunsetSheetDismissed = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("Clouds Is Being Sunset")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.vertical, 48)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("On October 31, Clouds will be sunset. After this date, it will no longer be able to load weather data and will no longer be available for download.")
                
                Text("The mobile landscape is constantly evolving, and a number of great alternatives are available. I highly recommend trying out Apple Weather, Carrot Weather, and Hello Weather.")
                
                Text("Sorry for any inconvenience, but I appreciate your support. I'm looking forward to bringing more great apps to devices near you!")
            }
            .padding(.horizontal, 10)
        
            Spacer()
            
            Button {
                sunsetSheetDismissed = true
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Got it!")
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        }
        .padding()
    }
}
