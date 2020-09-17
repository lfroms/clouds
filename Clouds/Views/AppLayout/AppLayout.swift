//
//  AppLayout.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-06-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppLayout: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack(alignment: .bottom) {
                MeasurementGridContainer()

                SlidingPanelContainer {
                    MasterViewContainer()
                        .accessibility(identifier: "master")
                }
            }
            .overlay(AlertListContainer())

            NavigationBar()
                .equatable()
                .padding(.bottom, 12)
        }
        .overlay(LocationPickerSectionModal())
        .overlay(Header(), alignment: .top)
        .background(BlackBackground().ignoresSafeArea(.all))
        .foregroundColor(AppColor.Display.primary)
    }
}

struct AppLayout_Previews: PreviewProvider {
    static var previews: some View {
        AppLayout()
    }
}
