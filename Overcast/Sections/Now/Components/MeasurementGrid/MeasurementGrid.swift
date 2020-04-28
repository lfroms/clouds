//
//  MeasurementGrid.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MeasurementGrid: View {
    var measurements: [MeasurementDescriptor]
    var didCalculateHeight: (CGFloat) -> Void

    var body: some View {
        GridStack(columns: 2, numberOfItems: measurements.count, spacingVertical: 22, spacingHorizontal: 0) { index in
            HStack {
                MeasurementItem(descriptor: self.measurements[index])
                    .equatable()

                Spacer()
            }
        }
        .padding(30)
        .background(GeometryReader(content: useProxy))
    }

    private func useProxy(_ proxy: GeometryProxy) -> some View {
        didCalculateHeight(proxy.size.height)
        return Rectangle().foregroundColor(Color.clear)
    }
}

extension MeasurementGrid: Equatable {
    static func == (lhs: MeasurementGrid, rhs: MeasurementGrid) -> Bool {
        lhs.measurements == rhs.measurements
    }
}

struct CurrentConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementGrid(measurements: [], didCalculateHeight: { _ in })
    }
}
