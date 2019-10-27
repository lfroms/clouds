//
//  AlertStack.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AlertStack: View {
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            AlertIndicator()
            AlertIndicator()
        }
    }
}

struct AlertStack_Previews: PreviewProvider {
    static var previews: some View {
        AlertStack()
    }
}
