//
//  ConditionIconDetail.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-03-22.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ConditionIconDetail: View {
    let symbol: String
    let text: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 5) {
            Image(systemName: symbol)
            Text(text)
        }
        .font(Font.footnote.bold())
    }
}

extension ConditionIconDetail: Equatable {}

struct ConditionIconDetail_Previews: PreviewProvider {
    static var previews: some View {
        ConditionIconDetail(symbol: "umbrella.fill", text: "25%")
    }
}
