//
//  RegionalNormalsSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RegionalNormalsSection: View {
    let viewModel: RegionalNormalsViewModel

    var body: some View {
        LabeledSection(label: "Regional Normals", headerPadding: 36, tinted: false) {
            IconDetailCollection(items: self.viewModel.items)
                .padding(.horizontal, 36)
        }
    }
}

#if DEBUG
struct RegionalNormalsSection_Previews: PreviewProvider {
    static var previews: some View {
        RegionalNormalsSection(viewModel: .init(weather: nil))
    }
}
#endif
