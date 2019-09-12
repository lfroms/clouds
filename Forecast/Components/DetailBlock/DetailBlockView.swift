//
//  DetailBlockView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-07-04.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct DetailBlockView: View {
    var data: DetailBlockDescriptor

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            renderIcon()
            renderLabelValue()
        }
        .padding(.leading, 18)
        .padding(.trailing, 20)
        .frame(height: 60, alignment: .leading)
        .background(Color.primary.opacity(0.06))
        .clipped()
        .shadow(color: Color.black.opacity(0.06), radius: 2, x: 0, y: 2)
        .cornerRadius(18)
        .fixedSize()
    }

    fileprivate func renderIcon() -> some View {
        return Image(systemName: data.symbolName)
            .font(Font.system(size: 18).weight(.bold))
    }

    fileprivate func renderLabelValue() -> some View {
        return VStack(alignment: .leading, spacing: 2) {
            Text(data.label.uppercased())
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .foregroundColor(Color.primary.opacity(0.6))
                .lineLimit(1)

            HStack(alignment: .firstTextBaseline, spacing: 2) {
                if data.valuePrefix != nil {
                    Text(data.valuePrefix!)
                        .font(.system(size: 13))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.primary.opacity(0.8))
                        .lineLimit(1)
                }

                Text(data.value)
                    .font(.system(size: 16))
                    .fontWeight(.heavy)
                    .lineLimit(1)
            }
        }
    }
}

#if DEBUG
struct DetailBlockView_Previews: PreviewProvider {
    static var previews: some View {
        DetailBlockView(data: DetailBlockDescriptor(symbolName: "umbrella.fill", value: "10%", label: "Humidity"))
    }
}
#endif
