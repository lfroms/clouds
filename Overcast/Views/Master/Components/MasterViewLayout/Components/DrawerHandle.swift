//
//  DrawerHandle.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2019-09-14.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DrawerHandle: View {
    let height: CGFloat

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
                .frame(width: 60, height: 4)
                .foregroundColor(AppColor.Control.subdued)
                .background(Color.clear)
                .cornerRadius(2)
        }
        .frame(height: height)
    }
}

struct DrawerHandle_Previews: PreviewProvider {
    static var previews: some View {
        DrawerHandle(height: 26)
    }
}
