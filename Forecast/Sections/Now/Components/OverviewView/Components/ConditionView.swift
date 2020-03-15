//
//  ConditionView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ConditionView: View {
    var condition: String

    var body: some View {
        Text(condition)
            .font(.system(size: 20))
            .fontWeight(.bold)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

extension ConditionView: Equatable {}

struct ConditionView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionView(condition: "Partly Cloudy")
    }
}
