//
//  OmniBarTextField.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBarTextField<Placeholder: View & Equatable>: View, Equatable {
    @Binding var text: String

    var placeholder: Placeholder
    var commit: () -> Void = {}

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
            }

            TextField(String.empty, text: $text, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .disableAutocorrection(true)
                // TextField is shifted upwards by 2 by default
                .padding(.top, 2)
        }
    }

    // MARK: - Equatable

    static func == (lhs: OmniBarTextField<Placeholder>, rhs: OmniBarTextField<Placeholder>) -> Bool {
        lhs.text == rhs.text && lhs.placeholder == rhs.placeholder
    }
}

struct OmniBarTextField_Previews: PreviewProvider {
    static var previews: some View {
        OmniBarTextField(text: .constant("Text"), placeholder: Text("Placeholder"))
    }
}
