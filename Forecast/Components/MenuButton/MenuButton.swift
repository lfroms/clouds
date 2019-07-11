//
//  MenuButton.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-06.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack(alignment: .center) {
                BlurView(style: .light)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                Image(systemName: "gear")
                    .font(Font.system(size: 16).weight(.bold))
                    .foregroundColor(.white)
            }
        }
        .shadow(color: Color.black.opacity(0.2), radius: 8, y: 3)
    }
}

#if DEBUG
struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(action: { print("hello") })
    }
}
#endif
