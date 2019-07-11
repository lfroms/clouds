//
//  DetailBlockRow.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-06.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DetailBlockRow: View {
    var items: [DetailBlockDescriptor]
    var spacing: Length

    var body: some View {
        HStack(alignment: .center, spacing: spacing) {
            ForEach(items.identified(by: \.id)) { item in
                DetailBlockView(data: item)
            }
        }
    }
}

#if DEBUG
struct DetailBlockGrid_Previews: PreviewProvider {
    static var previews: some View {
        DetailBlockRow(items: [], spacing: 6)
    }
}
#endif
