//
//  Header.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-29.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack(alignment: .top) {
            OmniBarBackground()
                .edgesIgnoringSafeArea(.top)

            VStack(alignment: .leading, spacing: 20) {
                OmniBar(textFieldValue: "Ottawa (Kanata – Orléans)", primaryIcon: "location.fill")

                RiseSetView()
            }
            .padding(20)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
