//
//  YesterdayConditionsSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct YesterdayConditionsSection: View {
    let viewModel: YesterdayConditionsViewModel

    var body: some View {
        LabeledSection(label: "Yesterday", headerPadding: 36, tinted: false) {
            IconDetailCollection(items: self.viewModel.items)
                .padding(.horizontal, 36)
        }
    }
}

#if DEBUG
struct YesterdayConditionsSection_Previews: PreviewProvider {
    static var previews: some View {
        YesterdayConditionsSection(viewModel: .init(weather: nil))
    }
}
#endif
