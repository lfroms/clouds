//
//  MeasurementGrid.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import Combine
import SwiftUI

struct MeasurementGrid: View {
    var measurements: [MeasurementDescriptor]
    var didCalculateHeight: ((CGFloat) -> Void)?
    
    var body: some View {
        calculateAndSetHeight()
        
        return GridStack(columns: 2, numberOfItems: measurements.count, spacingVertical: 22, spacingHorizontal: 0) { index in
            HStack {
                MeasurementItem(descriptor: self.measurements[index])
                    .equatable()
                
                Spacer()
            }
        }
        .equatable()
        .padding(30)
    }
    
    private var numberOfRows: Int {
        let numberOfRowsFloat = ceil(CGFloat(measurements.count) / 2)
        return Int(numberOfRowsFloat)
    }
    
    private func calculateAndSetHeight() {
        // TODO: - Remove hardcoded values
        
        let rowHeight: Int = 50
        let totalRowHeight = rowHeight * numberOfRows
        
        let paddingSize: Int = 22
        let totalOuterPadding: Int = 2 * 30
        let totalPadding = (paddingSize * (numberOfRows - 1)) + totalOuterPadding
        
        didCalculateHeight?(CGFloat(totalRowHeight + totalPadding))
    }
}

extension MeasurementGrid: Equatable {
    static func == (lhs: MeasurementGrid, rhs: MeasurementGrid) -> Bool {
        lhs.measurements == rhs.measurements
    }
}

struct CurrentConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementGrid(measurements: [])
    }
}
