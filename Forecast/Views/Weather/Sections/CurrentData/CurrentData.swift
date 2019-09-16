//
//  CurrentData.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-09-13.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentData: View {
    let viewModel: HomeSectionViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            DetailBlockCollection(items: viewModel.observations, rows: 2, spacing: 10)
                .padding(.horizontal, 18)
        }
    }
}

struct CurrentData_Previews: PreviewProvider {
    static var previews: some View {
        CurrentData(viewModel: .init(weather: nil))
    }
}
