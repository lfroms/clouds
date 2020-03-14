//
//  AppLayout.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-06-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppLayout: View {
    var body: some View {
        ZStack(alignment: .top) {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 12) {
                ZStack(alignment: .bottom) {
                    MeasurementGridContainer()

                    SlidingPanelContainer {
                        MasterViewContainer()
                    }
                    .edgesIgnoringSafeArea(.top)
                }

                NavigationBar()
                    .equatable()
                    .padding(.bottom, 12)
            }
            .overlay(LocationPickerSectionModal())

            Header()
        }
    }
}

struct AppLayout_Previews: PreviewProvider {
    static var previews: some View {
        AppLayout()
    }
}
