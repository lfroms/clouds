//
//  OmniBarTextField.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBarTextField<Placeholder: View>: View {
    var placeholder: Placeholder
    @Binding var text: String
    var editingChanged: (Bool) -> () = { _ in }
    var commit: () -> () = {}

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
            }

            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .disableAutocorrection(true)
                // TextField is shifted upwards by 2 by default
                .padding(.top, 2)
        }
    }
}

struct OmniBarTextField_Previews: PreviewProvider {
    static var previews: some View {
        OmniBarTextField(placeholder: Text("Placeholder"), text: .constant("Text"))
    }
}
