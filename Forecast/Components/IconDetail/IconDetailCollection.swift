//
//  IconDetailCollection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-10.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct IconDetailCollection: View {
    let items: [IconDetailDescriptor]

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 24) {
            ForEach(items, id: \.id) { item in
                IconDetailView(symbolName: item.symbolName, text: item.text)
            }
        }
    }
}

#if DEBUG
struct IconDetailCollection_Previews: PreviewProvider {
    static var previews: some View {
        IconDetailCollection(items: [])
    }
}
#endif
