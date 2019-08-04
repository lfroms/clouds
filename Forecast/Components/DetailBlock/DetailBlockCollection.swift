//
//  DetailBlockCollection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-07.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DetailBlockCollection: View {
    let items: [DetailBlockDescriptor]
    let rows: Int
    let spacing: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            generateRows(rows: rows)
        }
    }

    fileprivate func generateRows(rows: Int) -> some View {
        var itemRows: [[DetailBlockDescriptor]] = []

        for row in 0 ... rows - 1 {
            itemRows.append(stride(from: row, to: items.count, by: rows).map { items[$0] })
        }

        return Group {
            ForEach(itemRows.indices) { row in
                DetailBlockRow(items: itemRows[row], spacing: 10)
            }
        }
    }
}

#if DEBUG
struct DetailBlockCollection_Previews: PreviewProvider {
    static var previews: some View {
        DetailBlockCollection(items: [], rows: 2, spacing: 10)
    }
}
#endif
