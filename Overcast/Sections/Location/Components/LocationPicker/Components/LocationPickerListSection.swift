//
//  LocationPickerListSection.swift
//  Overcast
//
//  Created by Lukas Romsicki on 2020-03-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPickerListSection<Content: View>: View {
    var label: String
    var value: String?

    @Binding var loading: Bool

    var auxiliaryButton: (text: String, action: () -> Void)?
    var content: () -> Content

    @inlinable init(
        label: String,
        value: String? = nil,
        loading: Binding<Bool>,
        auxiliaryButton: (text: String, action: () -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.label = label
        self.value = value
        self._loading = loading
        self.auxiliaryButton = auxiliaryButton
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.LocationPicker.itemSpacing) {
            HStack(alignment: .center, spacing: Dimension.LocationPicker.itemSpacing) {
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(label)
                        .font(.callout)
                        .fontWeight(.semibold)

                    if value != nil {
                        Text(" \(value!)")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                }

                Spacer()

                if auxiliaryButton != nil {
                    Button(action: auxiliaryButton!.action, label: {
                        Text(auxiliaryButton!.text.uppercased())
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white.opacity(0.6))
                    })
                }

                if loading {
                    AppActivityIndicator(style: .dark)
                        .equatable()
                }
            }

            content()
        }
    }
}

struct LocationPickerListSection_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerListSection(label: "Test section", loading: .constant(false)) {
            EmptyView()
        }
    }
}
