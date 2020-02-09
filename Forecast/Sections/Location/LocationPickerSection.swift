//
//  LocationPickerSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPickerSection: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerSection()
    }
}
